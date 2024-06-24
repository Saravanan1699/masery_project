import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencySelection extends StatelessWidget {
  final List<String> currencies = [
    'USD - United States Dollar',
    'CAD - Canadian Dollar',
    'MXN - Mexican Peso',
    'GBP - British Pound',
    'EUR - Euro',
    'JPY - Japanese Yen',
    'CNY - Chinese Yuan',
    'INR - Indian Rupee',
    'AUD - Australian Dollar'
  ];

  final Map<String, String> currencySymbols = {
    'USD': '\$',
    'CAD': 'C\$',
    'MXN': '\$',
    'GBP': '£',
    'EUR': '€',
    'JPY': '¥',
    'CNY': '¥',
    'INR': '₹',
    'AUD': 'A\$'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Select Currency',
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
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          String currencyCode = currencies[index].split(' - ')[0];
          String currencyName = currencies[index].split(' - ')[1];
          String currencySymbol = currencySymbols[currencyCode] ?? '';

          return ListTile(
            title: Row(
              children: [
                Text(
                  '$currencySymbol ',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF222222),
                  ),
                ),
                Expanded(
                  child: Text(
                    '$currencyName ($currencyCode)',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context, currencies[index]);
            },
          );
        },
      ),
    );
  }
}
