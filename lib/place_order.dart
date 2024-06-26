import 'package:flutter/material.dart';
import 'bottombar.dart';
import 'home.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  int _selectedQuantity = 1;
  final List<int> _quantities = [1, 2, 3, 4, 5];
  bool showCouponRow = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shopping Bag'),
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 15,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    child: Image.asset('assets/shopping_laptop.png'),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HP OMEN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          '13th Gen Intel Core i7-13700HX,\n 8GB  RTX 4060....',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            Container(
                              height: screenHeight * 0.05,
                              width: screenWidth * 0.25,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Color(0xffF2F2F2),
                              ),
                              child: Center(
                                child: DropdownButton<int>(
                                  value: _selectedQuantity,
                                  underline:
                                      SizedBox(), // Remove the default underline
                                  items: _quantities.map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text('Qty $value'),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedQuantity = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Text(
                              'Delivery by',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Text(
                              '10 May 2XXX',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Column(
                children: [
                  if (showCouponRow)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              height: 30,
                              width: 40,
                                'assets/coupon.png'), // Corrected the file name
                            SizedBox(width: 5),
                            Text(
                              'Apply Coupons',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showCouponRow = false;
                            });
                            // Add your logic for applying a coupon here
                          },
                          child: Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0D6EFD),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!showCouponRow)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter coupon code',
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showCouponRow = true;
                              });
                              // Add your logic for handling the button press here
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff0D6EFD)),
                            ),
                            child: const Text(
                              'Apply',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Divider(thickness: 2),
              SizedBox(height: screenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Payment Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Amount', style: TextStyle(fontSize: 18)),
                      Text(
                        '\$ 7000.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Convenience', style: TextStyle(fontSize: 18)),
                          SizedBox(width: 5),
                          Text('Know More',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff0D6EFD))),
                        ],
                      ),
                      Text('Apply Coupon',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffEA1712))),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee', style: TextStyle(fontSize: 18)),
                      Text(
                        'Free',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0D6EFD)),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Divider(thickness: 2),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(
                        '\$ 7000.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      Text('EMI Available ', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 5),
                      Text('Details',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0D6EFD))),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Divider(thickness: 2),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$ 7000.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('View Details',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff0D6EFD))),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff0D6EFD),
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Processs to Payment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        onTap: (index) {
          setState(() {});
        }, favoriteProducts: [],
      ),
    );
  }
}
