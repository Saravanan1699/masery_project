import 'package:flutter/material.dart';

import 'Checkout.dart';
import 'bottombar.dart';
import 'home.dart';

class shopping extends StatefulWidget {
  const shopping({super.key});

  @override
  State<shopping> createState() => _shoppingState();
}

class _shoppingState extends State<shopping> {
  bool _isClicked = false;
  bool _isClicked1 = false;
  bool _isClicked2 = false;
  bool _isClicked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Checkout'),
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
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => checkout()));
                  });
                },
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked1 = !_isClicked1; // Toggle the state on each tap
                  });
                },
                child: Container(
                  height: 60,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(15),
                    border: _isClicked1 ? Border.all(color: Color(0xFFF83758)) : null, // Apply border color only if clicked
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/paypal.png',
                        height: 80,
                        width: 70,),
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked2 = !_isClicked2; // Toggle the state on each tap
                  });
                },
                child: Container(
                  height: 60,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(15),
                    border: _isClicked2 ? Border.all(color: Color(0xFFF83758)) : null, // Apply border color only if clicked
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/maestro.png',
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked3= !_isClicked3; // Toggle the state on each tap
                  });
                },
                child: Container(
                  height: 60,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(15),
                    border: _isClicked3 ? Border.all(color: Color(0xFFF83758)) : null, // Apply border color only if clicked
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/Apple.png',
                        height: 80,
                        width: 70,),
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child:  Column(
                          children: [
                            Image.asset('assets/tick.png',),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),),
                        content: Text('Payment done successfully.',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                        ),),
                        actions: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));                            },
                              child: Text('Home',
                                style: TextStyle(color: Colors.white, fontSize: 15),
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
                },
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0D6EFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(300, 50),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        onTap: (index) {
          setState(() {});
        },
        favoriteProducts: [],
      ),
    );
  }
}
