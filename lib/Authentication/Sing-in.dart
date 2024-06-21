import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>(); // Key to identify the form

  @override
  Widget build(BuildContext context) {
    // Getting the screen width and height for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow bottom inset to avoid keyboard
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_circle_left_outlined, color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% of screen width padding
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello Again!',
                    style: GoogleFonts.raleway( // Using Google Fonts
                      fontSize: screenWidth * 0.08, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B2B2B),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive height
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fill your details or continue with\nsocial media',
                    style: GoogleFonts.poppins( // Using Google Fonts
                      fontSize: screenWidth * 0.05, // Responsive font size
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF707B81),
                    ),
                    textAlign: TextAlign.center, // Align the text to the center
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.1), // Responsive height
              Row(
                children: [
                  Text(
                    'Email Address',
                    style: GoogleFonts.raleway( // Using Google Fonts
                      fontSize: screenWidth * 0.05, // Responsive font size
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF2B2B2B),
                    ),
                    textAlign: TextAlign.center, // Align the text to the center
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Color(0xFFF7F7F9),
                  filled: true,
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    fontSize: screenWidth * 0.045,
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
                  // Add additional validation if needed
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Text(
                    'Password',
                    style: GoogleFonts.raleway( // Using Google Fonts
                      fontSize: screenWidth * 0.05, // Responsive font size
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF2B2B2B),
                    ),
                    textAlign: TextAlign.center, // Align the text to the center
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Color(0xFFF7F7F9),
                  filled: true,
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    fontSize: screenWidth * 0.045,
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
                  // Add additional validation if needed
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Recovery Password ?',
                    style: GoogleFonts.raleway( // Using Google Fonts
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF707B81),
                    ),
                    textAlign: TextAlign.center, // Align the text to the center
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0D6EFD),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: screenWidth * 0.35,
                  ),
                ),
                child: Text(
                  'Sign',
                  style: GoogleFonts.raleway( // Using Google Fonts
                    fontSize: screenWidth * 0.04, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center, // Align the text to the center
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
