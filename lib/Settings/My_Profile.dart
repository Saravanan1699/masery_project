import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottombar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow bottom inset to avoid keyboard
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_circle_left_outlined, color: Colors.black),
        title: Text('My Profile',
          style: GoogleFonts.raleway( // Using Google Fonts
            fontSize: screenWidth * 0.07, // Responsive font size
            fontWeight: FontWeight.w700,
            color: Color(0xFF2B2B2B),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Add your search action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30, // Size of the avatar
                    backgroundImage: AssetImage('assets/avatar.png'), // Replace with your image asset
                  ),
                  SizedBox(width: 16), // Space between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Matilda Brown',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.05, // Responsive font size
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2B2B2B),
                        ),
                      ),
                      Text(
                        'matildabrown@mail.com',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04, // Responsive font size
                          color: Color(0xFF2B2B2B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My orders',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.035, // Responsive font size
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF222222),
                  ),
                ),
                Text(
                  'Already have 12 orders',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.03, // Responsive font size
                    color: Color(0xFF9B9B9B),
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
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035, // Responsive font size
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222222),
                        ),
                      ),
                      Text(
                        '3 ddresses',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.03, // Responsive font size
                          color: Color(0xFF9B9B9B),
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
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035, // Responsive font size
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222222),
                        ),
                      ),
                      Text(
                        'Visa **34',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.03, // Responsive font size
                          color: Color(0xFF9B9B9B),
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
                        'Promocodes',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035, // Responsive font size
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222222),
                        ),
                      ),
                      Text(
                        'You have special promocodes',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.03, // Responsive font size
                          color: Color(0xFF9B9B9B),
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
                        'My reviews',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035, // Responsive font size
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222222),
                        ),
                      ),
                      Text(
                        'Reviews for 4 items',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.03, // Responsive font size
                          color: Color(0xFF9B9B9B),
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
                        'Settings',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035, // Responsive font size
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222222),
                        ),
                      ),
                      Text(
                        'Notifications, password',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.03, // Responsive font size
                          color: Color(0xFF9B9B9B),
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
