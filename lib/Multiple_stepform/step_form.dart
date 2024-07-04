import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masery_project/home.dart';
import 'package:http/http.dart' as http;

class MultistepForm extends StatefulWidget {
  final Map<String, dynamic> product;
  const MultistepForm({Key? key, required this.product}) : super(key: key);

  @override
  _MultistepFormState createState() => _MultistepFormState();
}

class _MultistepFormState extends State<MultistepForm> {
  int _activeStepIndex = 0;
  bool _isClicked = false;
  bool _isClicked1 = false;
  bool _isClicked2 = false;
  bool _isClicked3 = false;
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  String cartId = '';

  void fetchCartData() async {
    var apiUrl = 'https://sgitjobs.com/MaseryShoppingNew/public/api/totalitems';

    // Make GET request
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse JSON response
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        cartId = jsonResponse['cart_id']; // Store cart_id in a variable
      });
      print('Cart ID: $cartId');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
              )
          )


        ],
      ),
    ),
    Step(
      state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 1,
      title: const Text('Order'),
      content:SingleChildScrollView(
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Icon(Icons.location_on_outlined),
            //     SizedBox(width: 10,),
            //     Text('Delivery Address',
            //       style: TextStyle(
            //           fontSize: 17,
            //           fontWeight: FontWeight.w500
            //       ),),
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   children: [
            //     Card(
            //       elevation: 4,
            //       color: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       child: SizedBox(
            //         height: 95,
            //         width: 250,
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             children: [
            //               Row(
            //                 children: [
            //                   Text('Address :',
            //                     style: TextStyle(
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.w500
            //                     ),),
            //                   Spacer(),
            //                   Icon(Icons.edit_note),
            //                   SizedBox(
            //                     width: 15,
            //                   )
            //                 ],
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Row(
            //                 children: [
            //                   Column(
            //                     children: [
            //                       Text('216 St Paul`s Rd, London N1 2LL,\n UK,Contact :  +44-784232'),
            //                     ],
            //                   ),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Card(
            //       elevation: 4,
            //       color: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       child: SizedBox(
            //         height: 95,
            //         width: 75,
            //         child: Center(
            //           child: Column(
            //             children: [
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               IconButton(onPressed: (){
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) => shopping()));
            //               },
            //                   icon: Icon(Icons.add_circle_outline_outlined,
            //                     size: 55,))
            //             ],
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(height: 15,),
            Row(
              children: [
                Text('Shipping List',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17
                  ),),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Card(
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
                          Image.asset('assets/lap.png',
                            height: 120,
                            width: 140,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('HP OMEN ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16
                                ),),
                              Row(
                                children: [
                                  Text('Variations : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    ),),
                                  Card(
                                    elevation: 4,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: SizedBox(
                                      height: 25,
                                      width: 45,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Black',
                                            style: TextStyle(fontWeight: FontWeight.w400),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 4,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: SizedBox(
                                      height: 25,
                                      width: 40,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Red',
                                            style: TextStyle(fontWeight: FontWeight.w400),),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('4.8',
                                    style: TextStyle(fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.star,size: 15,color: Colors.yellow,),
                                  Icon(Icons.star,size: 15,color: Colors.yellow,),
                                  Icon(Icons.star,size: 15,color: Colors.yellow,),
                                  Icon(Icons.star,size: 15,color: Colors.yellow,),
                                  Icon(Icons.star_half,size: 15,color: Colors.yellow,),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                          height: 30,
                                          width: 100,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('\$ 34.00',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17
                                                ),),
                                            ],
                                          )
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('upto 33% off',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xffEB3030)
                                        ),),
                                      Text('\$ 64.00',
                                        style: TextStyle(
                                          color: Color(0xffA7A7A7),
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: Color(0xffA7A7A7),
                                        ),),
                                    ],
                                  )

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Total Order (1)   :',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),),
                          Spacer(),
                          Text('\$ 34.00',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    ),
    Step(
      state: StepState.complete,
      isActive: _activeStepIndex >= 2,
      title: const Text('Paymeny'),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
          child: Column(
            children: [
              Divider(
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Order',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFA8A8A9)
                    ),),
                  Spacer(),
                  Text('\$ 7,000',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFA8A8A9)
                    ),),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Shipping',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFA8A8A9)
                    ),),
                  Spacer(),
                  Text('\$ 30',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFA8A8A9)
                    ),),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Total',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),),
                  Spacer(),
                  Text('\$ 7030',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.grey[600],
                indent: 15,
                endIndent: 15,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Payment',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked = !_isClicked; // Toggle the state on each tap
                  });
                },
                child: Container(
                  height: 60,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(15),
                    border: _isClicked ? Border.all(color: Color(0xFFF83758)) : null, // Apply border color only if clicked
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/visa.png',
                        height: 50,
                        width: 60,),
                      Text('*********2109',
                        style: TextStyle(
                            color: Color(0XFF6E7179),
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (cartId.isNotEmpty) { // Check if cartId is not empty
                    var url = Uri.parse(
                        'https://sgitjobs.com/MaseryShoppingNew/public/api/cart/$cartId/checkout');
                    var response = await http.post(url);

                    if (response.statusCode == 200) {
                      // Successful response
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Checkout Successful'),
                          content: Text('Your order has been placed.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Additional actions after successful checkout
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Error handling
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content:
                          Text('Failed to checkout. Please try again later.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Additional error handling if needed
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    // Handle case where cartId is still empty (fetching data scenario)
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Cart ID is not available yet.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Handle accordingly, e.g., retry fetching data
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text(
                  'Buy Now',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0D6EFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(150, 50),
                ),

              ),

              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       _isClicked1 = !_isClicked1; // Toggle the state on each tap
              //     });
              //   },
              //   child: Container(
              //     height: 60,
              //     width: 340,
              //     decoration: BoxDecoration(
              //       color: Color(0xFFF4F4F4),
              //       borderRadius: BorderRadius.circular(15),
              //       border: _isClicked1 ? Border.all(color: Color(0xFFF83758)) : null, // Apply border color only if clicked
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Image.asset('assets/paypal.png',
              //           height: 80,
              //           width: 70,),
              //         Text('*********2109',
              //           style: TextStyle(
              //               color: Color(0XFF6E7179),
              //               fontSize: 15,
              //               fontWeight: FontWeight.w500
              //           ),),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       _isClicked2 = !_isClicked2; // Toggle the state on each tap
              //     });
              //   },
              //   child: Container(
              //     height: 60,
              //     width: 340,
              //     decoration: BoxDecoration(
              //       color: Color(0xFFF4F4F4),
              //       borderRadius: BorderRadius.circular(15),
              //       border: _isClicked2 ? Border.all(color: Color(0xFFF83758)) : null, // Apply border color only if clicked
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Image.asset('assets/maestro.png',
              //           height: 50,
              //           width: 60,),
              //         Text('*********2109',
              //           style: TextStyle(
              //               color: Color(0XFF6E7179),
              //               fontSize: 15,
              //               fontWeight: FontWeight.w500
              //           ),),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       _isClicked3= !_isClicked3; // Toggle the state on each tap
              //     });
              //   },
              //   child: Container(
              //     height: 60,
              //     width: 340,
              //     decoration: BoxDecoration(
              //       color: Color(0xFFF4F4F4),
              //       borderRadius: BorderRadius.circular(15),
              //       border: _isClicked3 ? Border.all(color: Color(0xFFF83758)) : null, // Apply border color only if clicked
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Image.asset('assets/Apple.png',
              //           height: 80,
              //           width: 70,),
              //         Text('*********2109',
              //           style: TextStyle(
              //               color: Color(0XFF6E7179),
              //               fontSize: 15,
              //               fontWeight: FontWeight.w500
              //           ),),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
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
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffF7F7F9),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
              ),
            );
          },
        ),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        connectorColor: MaterialStateProperty.all(Color(0xff0D6EFD)),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
            print('Submitted');
            // Perform final submission action
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/tick.png',
                          // Adjust image asset path as per your project structure
                        ),
                        SizedBox(width: 20),
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
                          'Pay Now', // Changed from 'Home' to 'Pay Now'
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
                    // if (_formKey.currentState!.validate()) {
                      // If the form is valid, proceed with the action
                      if (!isLastStep) {
                        // Handle save action for each step
                        details.onStepContinue!();
                      }
                    // }
                  },
                  child: Text(
                    isLastStep ? 'Back' : 'Save', // Changed from 'Submit' to 'Save'
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
                      // Handle submit action here if needed
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/tick.png',
                                    // Adjust image asset path as per your project structure
                                  ),
                                  SizedBox(width: 20),
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
                    } else {
                      // Handle cancel/back action for each step
                      if (_activeStepIndex > 0) {
                        setState(() {
                          _activeStepIndex -= 1;
                        });
                      }
                    }
                  },
                  child: Text(
                    isLastStep ? 'Paynow' : 'Back', // Changed from 'Home' to 'Pay Now' and 'Back'
                    style: TextStyle(
                      color: isLastStep ? Colors.white : Color(0xff0D6EFD),
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLastStep ? Color(0xff0D6EFD) : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xff0D6EFD),
                      ),
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


