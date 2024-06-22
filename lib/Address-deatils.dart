import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Categories.dart';
import 'home.dart';

class Addressdeatils extends StatefulWidget {
  const Addressdeatils({super.key});

  @override
  State<Addressdeatils> createState() => _AddressdeatilsState();
}

class _AddressdeatilsState extends State<Addressdeatils> {
  final _formKey = GlobalKey<FormState>();
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
                        MaterialPageRoute(builder: (context) => Categories()));
                  });
                },
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/avatar.png'),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                          left: 230,
                          bottom: 0,
                          child: Container(
                            height: 37,
                            width: 37,
                            decoration: BoxDecoration(
                              color: Color(0xff0D6EFD),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.mode_edit_outline_rounded,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ))
                    ],
                  ),
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
                        Divider(
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Bank Account Details',
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
                              'Bank Account Number',
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
                              return 'Please enter your Bank Account Number';
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
                              'Account Holder’s Name',
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
                              return 'Please enter your Account Holder’s Name';
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
                              'IFSC Code',
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
                              return 'Please enter your IFSC Code';
                            }
                            // Add additional validation if needed
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            }
                          },
                          child: Text(
                            'Save',
                            style:  GoogleFonts.raleway(color: Colors.white, fontSize: 17,
                            fontWeight: FontWeight.w500),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0D6EFD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(350, 50),
                          ),
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
          ),
        ],
      ),
    );
  }
}
