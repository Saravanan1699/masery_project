import 'package:flutter/material.dart';

class NotificationDetailView extends StatelessWidget {
  final String title;
  final String body;

  const NotificationDetailView({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            // Handle onTap if needed
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  body,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}