import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:masery_project/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MultistepForm extends StatefulWidget {
  final Map<String, dynamic> product;

  const MultistepForm({Key? key, required this.product}) : super(key: key);

  @override
  _MultistepFormState createState() => _MultistepFormState();
}

class _MultistepFormState extends State<MultistepForm> {
  int _activeStepIndex = 0;
  bool _isClicked = false;
  bool _isPaymentMethodSelected = false;

  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> product;
  List<Map<String, dynamic>>? productData;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  @override
  void initState() {
    super.initState();
    product = widget.product;
    fetchData();
    _getToken();
  }

  Future<void> fetchData() async {
    try {
      String cartId = await fetchCartId();
      String url =
          'https://sgitjobs.com/MaseryShoppingNew/public/api/cart/$cartId/checkout';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          productData = List<Map<String, dynamic>>.from(
              json.decode(response.body)['data'][0]['inventories']);
        });
      } else {
        throw Exception('Failed to load product data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<String> fetchCartId() async {
    final response = await http.get(Uri.parse(
        'https://sgitjobs.com/MaseryShoppingNew/public/api/totalitems'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String cartId = data['cart_id'].toString();
      return cartId;
    } else {
      throw Exception('Failed to fetch cart_id');
    }
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _handleCheckout() async {
    if (!_isPaymentMethodSelected) {
      _showSnackBar("Please select a payment method");
      return;
    }

    final token = await _getToken();
    if (token == null) {
      print("No token found");
      return;
    }

    try {
      final cartId = await fetchCartId();
      final url =
          'https://sgitjobs.com/MaseryShoppingNew/public/api/cart/$cartId/checkout';
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = jsonEncode({
        'payment_method_id': 1,
      });

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print("Checkout successful");
        _showSuccessDialog(); // Show success dialog
      } else {
        print("Checkout failed: ${response.statusCode}");
        // Handle error
      }
    } catch (e) {
      print("Error occurred: $e");
      // Handle network error
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/tick.png', // Adjust image asset path as per your project structure
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          content: Text(
            'Payment done successfully.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0D6EFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Address'),
          content: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Business Address Details',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'First Name',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your First Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Last Name',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Last Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone Number',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone Number';
                            }
                            if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
                              return 'Please enter a valid Phone Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Country',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Country';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Address',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Town / City',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Town or City';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Postcode / ZIP',
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Postcode or ZIP';
                            }
                            if (!RegExp(r'^\d{6}(-\d{6})?$').hasMatch(value)) {
                              return 'Please enter a valid Postcode or ZIP';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Order'),
          content: productData == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: productData!.map((product) {
                      return Card(
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SizedBox(
                          height: 215,
                          width: 340,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    product['product'] != null &&
                                            product['product']['images'] != null
                                        ? Image.network(
                                            'https://sgitjobs.com/MaseryShoppingNew/public/${product['product']['images'][0]['path']}',
                                            height: 120,
                                            width: 140,
                                            fit: BoxFit.contain,
                                          )
                                        : SizedBox(
                                            height: 120,
                                            width: 140,
                                            child: Center(
                                                child: Text(
                                                    'Image not available')),
                                          ),
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['title'] ??
                                              'Title not available',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'Price: \$${product['sale_price'] != null ? double.tryParse(product['sale_price'])?.toStringAsFixed(2) ?? 'N/A' : 'N/A'}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(color: Colors.grey[300]),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Total Order:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      product['pivot']['quantity'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '\$${product['pivot']?['unit_price'] != null ? double.tryParse(product['pivot']?['unit_price'])?.toStringAsFixed(2) ?? 'N/A' : 'N/A'}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Payment'),
          content: SingleChildScrollView(
            child: Column(
              children: productData!.map((product) {
                return Column(
                  children: [
                    Divider(color: Colors.grey[300]),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          'Order',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFA8A8A9),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${product['pivot']?['unit_price'] != null ? double.tryParse(product['pivot']?['unit_price'])?.toStringAsFixed(2) ?? 'N/A' : 'N/A'}',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFA8A8A9),
                          ),
                        ),
                        SizedBox(width: 20)
                      ],
                    ),
                    SizedBox(height: 15),
                    // Repeat similar structures for Shipping, Total, Payment sections
                    // Example:
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          'Shipping',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFA8A8A9),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$ 30',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFA8A8A9),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 20)
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          '\$${product['data']?['total'] != null ? double.tryParse(product['pivot']?['unit_price'])?.toStringAsFixed(2) ?? 'N/A' : 'N/A'}',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        SizedBox(width: 20)
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(
                      color: Colors.grey[600],
                      indent: 15,
                      endIndent: 15,
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          'Payment',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isClicked =
                              !_isClicked; // Toggle the state on each tap
                          _isPaymentMethodSelected =
                              true; // Mark payment method as selected
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: _isClicked
                                ? Color(0xFFF83758)
                                : Colors.transparent,
                          ), // Apply border color only if clicked
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Cash on delivery',
                              style: TextStyle(
                                color: Color(0XFF6E7179),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Checkout'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 15,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: productData == null
          ? Center(
              child: Container(
                child: LoadingAnimationWidget.halfTriangleDot(
                  size: 50.0, color: Colors.redAccent,
                ),
              ),
            )
          : Stepper(
              type: StepperType.horizontal,
              currentStep: _activeStepIndex,
              steps: stepList(),
              onStepContinue: () {
                if (_activeStepIndex < (stepList().length - 1)) {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _activeStepIndex += 1;
                    });
                  }
                } else {
                  _handleCheckout();
                }
              },
              onStepCancel: () {
                if (_activeStepIndex > 0) {
                  setState(() {
                    _activeStepIndex -= 1;
                  });
                }
              },
              onStepTapped: (int index) {
                setState(() {
                  _activeStepIndex = index;
                });
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = _activeStepIndex == stepList().length - 1;

                return Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (!isLastStep) {
                            if (_formKey.currentState != null) {
                              _formKey.currentState!.validate();
                            }
                          } else {
                            setState(() {
                              _activeStepIndex -= 1;
                            });
                          }
                        },
                        child: Text(
                          isLastStep ? 'Back' : 'Save',
                          style: TextStyle(
                            color: Color(0xff0D6EFD),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xff0D6EFD)),
                          ),
                          minimumSize: Size(150, 50),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (isLastStep) {
                            _handleCheckout();
                          } else if (_activeStepIndex > 0) {
                            setState(() {
                              _activeStepIndex -= 1;
                            });
                          }
                        },
                        child: Text(
                          isLastStep ? 'Pay Now' : 'Back',
                          style: TextStyle(
                            color:
                                isLastStep ? Colors.white : Color(0xff0D6EFD),
                            fontSize: 17,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isLastStep ? Color(0xff0D6EFD) : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xff0D6EFD)),
                          ),
                          minimumSize: Size(150, 50),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
