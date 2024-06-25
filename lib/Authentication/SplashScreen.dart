import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Sing-in.dart';

class PageViewExampleApp extends StatefulWidget {
  const PageViewExampleApp({Key? key}) : super(key: key);

  @override
  State<PageViewExampleApp> createState() => _PageViewExampleAppState();
}

class _PageViewExampleAppState extends State<PageViewExampleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(''),
        actions: [
          IconButton(
            icon: Icon(
              Icons.cancel,
              color: Color(0xffF87265),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signin(),
                  ));
            },
          ),
        ],
      ),
      body: const PageViewExample(),
    );
  }
}

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final double screenHeight = constraints.maxHeight;

        return Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: <Widget>[
                  _buildPage(
                    'Updated Products\n         '
                        'Everyday',
                    Image.asset('assets/splash_1.png'),
                    [
                      "Don't worry, you won't be ",
                      'outdated!',
                    ],
                    'Next',
                    () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    screenWidth,
                    screenHeight,
                  ),
                  _buildPage(
                    'Easy Transaction\n    '
                        'And Payment',
                    Image.asset('assets/splash_2.png'),
                    [
                      'Your package will come right to',
                      'Your door ASAP!',
                    ],
                    'Next',
                    () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    screenWidth,
                    screenHeight,
                  ),
                  _buildPage(
                    'Free-Shipping\n     '
                        'Vouchers',
                    Image.asset('assets/splash_3.png'),
                    [
                      'We care about your package as',
                      'you do',
                    ],
                    'Shopping Now',
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signin()));
                    },
                    screenWidth,
                    screenHeight,
                  ),
                ],
              ),
            ),
            _buildDotIndicator(),
            SizedBox(
                height: screenHeight * 0.05), // Adjust the height as needed
          ],
        );
      },
    );
  }

  Widget _buildPage(
      String title,
      Image image,
      List<String> texts,
      String buttonLabel,
      VoidCallback buttonAction,
      double screenWidth,
      double screenHeight) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.04),
            image,
            SizedBox(
                height: screenHeight * 0.02), // Space between image and title
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: screenWidth * 0.07, // Responsive font size
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2B2B2B),
              ),
            ),
            SizedBox(
                height: screenHeight * 0.01), // Space between title and texts
            ...texts
                .map((text) => Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                      child: Text(
                        text,
                        style: GoogleFonts.nunitoSans(
                          // Using Google Fonts
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF707B81),
                        ), // Responsive font size
                        textAlign: TextAlign.center,
                      ),
                    ))
                .toList(),
            SizedBox(
                height: screenHeight * 0.03), // Space between texts and button
            ElevatedButton(
              onPressed: buttonAction,
              child: Text(
                buttonLabel,
                style: GoogleFonts.raleway(
                  fontSize: screenWidth * 0.04, // Responsive font size
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff004CFF), // Background color
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                  horizontal: screenWidth * 0.15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12.0), // Curved border with 12.0 radius
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildDot(_currentPageIndex == 0),
        _buildDot(_currentPageIndex == 1),
        _buildDot(_currentPageIndex == 2),
      ],
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color(0xffF87265) : Color(0xff0D6EFD),
      ),
    );
  }
}
