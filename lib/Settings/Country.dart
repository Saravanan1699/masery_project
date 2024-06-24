import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountrySelection extends StatelessWidget {
  final List<String> countries = [
    'Singpore',
    'India',
    'Malaysia',
    'Indonesia',
    'United States',
    'Bangladesh',
    'Canada',
    'Mexico',
    'United Kingdom',
    'Germany',
    'France',
    'Japan',
    'China',
    'Australia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Select Country',
          style: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2B2B2B),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(countries[index],
              style: GoogleFonts.nunitoSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF222222),
              ),
            ),
            onTap: () {
              // Handle country selection logic here
              Navigator.pop(context, countries[index]);
            },
          );
        },
      ),
    );
  }
}
