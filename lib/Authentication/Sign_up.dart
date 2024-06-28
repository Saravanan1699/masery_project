import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Sing-in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> registerUser(String name, String email, String password,
      String password_confirmation) async {
    final url =
        Uri.parse('https://sgitjobs.com/MaseryShoppingNew/public/api/register');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Signin()),
        );
        showSuccessMessage('Registration successful!');
        print('Registration successful');
      } else {
        final responseBody = jsonDecode(response.body);
        final errorMessage =
            responseBody['message'] ?? 'Failed to register user';
        showErrorMessage(errorMessage);
        print('Registration failed: $errorMessage');
      }
    } catch (e) {
      showErrorMessage('Registration error: $e');
      print('Registration error: $e');
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined, size: 15),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signin()));
                },
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register Account',
                    style: GoogleFonts.raleway(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2B2B2B),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fill your details or continue with\nsocial media',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF707B81),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.1),
              Row(
                children: [
                  Text(
                    'Name',
                    style: GoogleFonts.raleway(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  fillColor: Color(0xFFF7F7F9),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
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
                    return 'Please enter your name';
                  } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Name can only contain letters';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Text(
                    'Email Address',
                    style: GoogleFonts.raleway(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  fillColor: Color(0xFFF7F7F9),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
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
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                      .hasMatch(value)) {
                    return 'Please enter a valid Gmail address';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Text(
                    'Password',
                    style: GoogleFonts.raleway(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  fillColor: Color(0xFFF7F7F9),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  labelStyle: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Color(0xFF6A6A6A),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText1 = !_obscureText1;
                      });
                    },
                    child: Icon(
                      _obscureText1 ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xff707B81),
                    ),
                  ),
                ),
                obscureText: _obscureText1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (!RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$')
                      .hasMatch(value)) {
                    return 'Password must be at least 8 characters and contain a special character';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Text(
                    'Confirm Password',
                    style: GoogleFonts.raleway(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  fillColor: Color(0xFFF7F7F9),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  labelStyle: TextStyle(
                    fontSize: screenWidth * .045,
                    color: Color(0xFF6A6A6A),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText2 = !_obscureText2;
                      });
                    },
                    child: Icon(
                      _obscureText2 ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xff707B81),
                    ),
                  ),
                ),
                obscureText: _obscureText2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String name = _nameController.text.trim();
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();
                    String password_confirmation =
                        _confirmPasswordController.text.trim();

                    registerUser(name, email, password, password_confirmation);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0D6EFD),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: screenWidth * 0.35,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.raleway(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF7F7F9),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: screenWidth * 0.15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/Google.png',
                      height: screenHeight * 0.03,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sign up with Google',
                      style: GoogleFonts.raleway(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account? ',
                    style: GoogleFonts.raleway(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF707B81),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signin()));
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.raleway(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
