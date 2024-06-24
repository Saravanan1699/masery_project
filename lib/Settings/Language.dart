import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  final List<String> languages = ['English', 'Spanish', 'French']; // Replace with your list of languages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]),
            onTap: () {
              Navigator.pop(context, languages[index]); // Pass back the selected language
            },
          );
        },
      ),
    );
  }
}
