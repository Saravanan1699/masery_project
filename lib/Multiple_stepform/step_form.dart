import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masery_project/home.dart';
import 'package:masery_project/shopping.dart';

class MultistepForm extends StatefulWidget {
  const MultistepForm({Key? key}) : super(key: key);

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

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

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
                          'Personal Details',
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
                          'Email Address',
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
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                            r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
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
                          'Password',
                          style: GoogleFonts.raleway(
                            // Using Google Fonts
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF2B2B2B),
                          ),
                          textAlign: TextAlign
                              .center, // Align the text to the center
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
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Change Password ',
                          style: GoogleFonts.raleway( // Using Google Fonts
                            fontWeight: FontWeight.normal,
                            color: Color(0xff0D6EFD),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff0D6EFD),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          'Pincode',
                          style: GoogleFonts.raleway(
                            // Using Google Fonts
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF2B2B2B),
                          ),
                          textAlign: TextAlign
                              .center, // Align the text to the center
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
                          return 'Please enter your Pincode';
                        }
                        // Add additional validation if needed
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
                            // Using Google Fonts
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF2B2B2B),
                          ),
                          textAlign: TextAlign
                              .center, // Align the text to the center
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
                        // Add additional validation if needed
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'City',
                          style: GoogleFonts.raleway(
                            // Using Google Fonts
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF2B2B2B),
                          ),
                          textAlign: TextAlign
                              .center, // Align the text to the center
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
                          return 'Please enter your City';
                        }
                        // Add additional validation if needed
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'State',
                          style: GoogleFonts.raleway(
                            // Using Google Fonts
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF2B2B2B),
                          ),
                          textAlign: TextAlign
                              .center, // Align the text to the center
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
                          return 'Please enter your State';
                        }
                        // Add additional validation if needed
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
                            // Using Google Fonts
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF2B2B2B),
                          ),
                          textAlign: TextAlign
                              .center, // Align the text to the center
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
                        // Add additional validation if needed
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    )
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
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 10,),
                Text('Delivery Address',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                  ),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    height: 95,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Address :',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),),
                              Spacer(),
                              Icon(Icons.edit_note),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text('216 St Paul`s Rd, London N1 2LL,\n UK,Contact :  +44-784232'),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    height: 95,
                    width: 75,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          IconButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => shopping()));
                          },
                              icon: Icon(Icons.add_circle_outline_outlined,
                                size: 55,))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
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
                          Image.asset('assets/top.png',
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
            SizedBox(
              height: 10,
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
                    if (!isLastStep) {
                      // Handle save action for each step
                      details.onStepContinue!();
                    }
                  },
                  child: Text(
                    isLastStep ? 'Back' : 'Save', // Changed from 'Submit' to 'Pay Now'
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


