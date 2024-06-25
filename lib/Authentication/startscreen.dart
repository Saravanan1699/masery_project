import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SplashScreen.dart';

class WelcomeSplashScreen extends StatefulWidget {
  @override
  _WelcomeSplashScreenState createState() => _WelcomeSplashScreenState();
}

class _WelcomeSplashScreenState extends State<WelcomeSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward().then((_) {
      // Navigate to the SignInPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PageViewExampleApp()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: YourSplashContentWidget(),
        ),
      ),
    );
  }
}

class YourSplashContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      color: Color(0xFFF7FBFF),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.1), // Add spacing from the top
            Image.asset(
              'assets/logo.png',
              width: screenWidth * 0.6, // Adjust width for responsiveness
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Masery',
              style: GoogleFonts.montserrat(
                fontSize: screenWidth * 0.1, // Responsive font size
                fontWeight: FontWeight.w700,
                color: Color(0xFF202020),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Beautiful eCommerce UI Kit\nfor your online store',
              style: GoogleFonts.nunitoSans(
                fontSize: screenWidth * 0.05, // Responsive font size
                fontWeight: FontWeight.w400,
                color: Color(0xFF202020),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageViewExampleApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0D6EFD),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Let\'s get started',
                style: GoogleFonts.raleway(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF3F3F3),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I already have an account',
                  style: GoogleFonts.nunitoSans(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9B9B9B),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Icon(
                  Icons.arrow_circle_right,
                  size: screenWidth * 0.06,
                  color: Color(0xFF004CFF),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.1), // Add spacing at the bottom
          ],
        ),
      ),
    );
  }
}
