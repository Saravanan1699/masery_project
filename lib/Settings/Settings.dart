import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bottombar.dart';
import 'Country.dart';
import 'Currency.dart';
import 'Language.dart';
import 'My_Profile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String selectedCountry = 'Select a country';
  String selectedCurrency = 'Select a currency';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow bottom inset to avoid keyboard
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Settings',
          style: GoogleFonts.raleway( // Using Google Fonts
            fontSize: screenWidth * 0.07, // Responsive font size
            fontWeight: FontWeight.w700,
            color: Color(0xFF2B2B2B),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                  size: 15,),
                onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                  });
                },
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Personal',
                      style: GoogleFonts.raleway(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right, // Replace with your desired icon
                      size: screenWidth * 0.06, // Responsive icon size
                      color: Color(0xFF9B9B9B),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping addresses',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right, // Replace with your desired icon
                      size: screenWidth * 0.06, // Responsive icon size
                      color: Color(0xFF9B9B9B),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment methods',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right, // Replace with your desired icon
                      size: screenWidth * 0.06, // Responsive icon size
                      color: Color(0xFF9B9B9B),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Text(
                      'Shop',
                      style: GoogleFonts.raleway(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(width: screenWidth * 0.4),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Text(
                    //       selectedCountry,
                    //       style: GoogleFonts.nunitoSans(
                    //         fontSize: screenWidth * 0.025, // Responsive font size
                    //         fontWeight: FontWeight.w700,
                    //         color: Color(0xFF9B9B9B),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountrySelection(),
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            selectedCountry = result;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            selectedCountry,
                            style: GoogleFonts.nunitoSans(
                              fontSize: screenWidth * 0.025, // Responsive font size
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF9B9B9B),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.keyboard_arrow_right, // Replace with your desired icon
                            size: screenWidth * 0.06, // Responsive icon size
                            color: Color(0xFF9B9B9B),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Currency',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        final selected = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CurrencySelection(),
                          ),
                        );
                        if (selected != null) {
                          setState(() {
                            selectedCurrency = selected;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            selectedCurrency.split(' - ')[0],
                            style: GoogleFonts.nunitoSans(
                              fontSize: screenWidth * 0.025, // Responsive font size
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF9B9B9B),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: screenWidth * 0.06,
                            color: Color(0xFF9B9B9B),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sizes',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right, // Replace with your desired icon
                        size: screenWidth * 0.06, // Responsive icon size
                        color: Color(0xFF9B9B9B),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Terms and Conditions',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right, // Replace with your desired icon
                        size: screenWidth * 0.06, // Responsive icon size
                        color: Color(0xFF9B9B9B),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Text(
                      'Account',
                      style: GoogleFonts.raleway(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Language',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        final selectedLanguage = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguageSelection(),
                          ),
                        );
                        if (selectedLanguage != null) {
                          setState(() {
                            // Handle selected language here
                            // For example, you could save it to a variable or update a provider
                            print('Selected language: $selectedLanguage');
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            'Selected Language', // Replace with your logic for displaying selected language
                            style: GoogleFonts.nunitoSans(
                              fontSize: screenWidth * 0.025,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF9B9B9B),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: screenWidth * 0.06,
                            color: Color(0xFF9B9B9B),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: GoogleFonts.nunitoSans(
                            fontSize: screenWidth * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right, // Replace with your desired icon
                      size: screenWidth * 0.06, // Responsive icon size
                      color: Color(0xFF9B9B9B),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xFF9B9B9B), // Customize divider color here
                  thickness: 0.1, // Customize divider thickness here
                  height: 20, // Customize divider height here
                  // indent: 5, // Customize left indentation of divider
                  // endIndent: 5, // Customize right indentation of divider
                ),
                SizedBox(height: screenHeight * 0.04),
                Row(
                  children: [
                    Text(
                      'Delete My Account',
                      style: GoogleFonts.raleway(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFD97474),
                      ),
                    ),
                  ],
                ),
              ],
            )
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
