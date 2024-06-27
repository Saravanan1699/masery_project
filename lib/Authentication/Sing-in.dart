import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Base_Url/BaseUrl.dart';
import '../home.dart';
import 'Sign_up.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText1 = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _saveToLocalStorage(String token, String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Token is $token");
    print("email is $username");
    await prefs.setString('token', token);
    await prefs.setString('email', username);
  }

  Future<Map<String, dynamic>> _authenticate(
      String username, String password) async {
    late Map<String, dynamic> responseData;

    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        responseData = jsonDecode(response.body);
        print(
            'Response data: $responseData'); // Print the entire response for inspection
        final String token = responseData['data']['token'] ?? '';
        final String email = responseData['data']['email'] ?? '';
        print('Retrieved username: $username');

        await _saveToLocalStorage(token, username);
        return {
          'success': true,
          'message': 'User LoggedIn Successfully!',
          'token': token,
          'email': email,
        };
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      throw Exception('Failed to authenticate: $e');
    }
  }

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final responseData = await _authenticate(email, password);
      if (responseData['success']) {
        // Show success message as Snackbar
        _showSuccessSnackBar(responseData['message']);

        // Navigate to the home page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        // Handle login failure
        _showError('Login failed');
      }
    } catch (e) {
      // Handle server error
      _showError('Failed to authenticate: ${e.toString()}');
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2), // Adjust as needed
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Getting the screen width and height for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow bottom inset to avoid keyboard
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05), // 5% of screen width padding
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
                    style: GoogleFonts.raleway(
                      // Using Google Fonts
                      fontSize: screenWidth * 0.07, // Responsive font size
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2B2B2B),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01), // Responsive height
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fill your details or continue with\nsocial media',
                    style: GoogleFonts.poppins(
                      // Using Google Fonts
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.w400,
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
                    style: GoogleFonts.raleway(
                      // Using Google Fonts
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B),
                    ),
                    textAlign: TextAlign.center, // Align the text to the center
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
                    borderRadius: BorderRadius.circular(12.0), // Curved border
                    borderSide: BorderSide.none, // No border
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
                      // Using Google Fonts
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B),
                    ),
                    textAlign: TextAlign.center, // Align the text to the center
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
                    borderRadius: BorderRadius.circular(12.0), // Curved border
                    borderSide: BorderSide.none, // No border
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
                obscureText: _obscureText1, // Use the _obscureText1 variable
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
              SizedBox(height: screenHeight * 0.01),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    'Recovery Password ?',
                    style: GoogleFonts.raleway(
                      // Using Google Fonts
                      fontSize: screenWidth * 0.035, // Responsive font size
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF707B81),
                    ),
                    textAlign: TextAlign.center, // Align the text to the center
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0D6EFD),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: screenWidth * 0.35,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Curved border with 12.0 radius
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: GoogleFonts.raleway(
                    // Using Google Fonts
                    fontSize: screenWidth * 0.04, // Responsive font size
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center, // Align the text to the center
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              ElevatedButton(
                onPressed: () {
                  // Add your Google sign-in logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF7F7F9), // Button background color
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: screenWidth * 0.18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Curved border with 12.0 radius
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/Google.png', // Path to your Google logo asset
                      height: screenHeight * 0.03, // Adjust as needed
                    ),
                    SizedBox(width: 10), // Spacing between logo and text
                    Text(
                      'Sign up with Google',
                      style: GoogleFonts.raleway(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New User ? ',
                    style: GoogleFonts.raleway(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF707B81),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.raleway(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
