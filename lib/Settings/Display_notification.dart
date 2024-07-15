import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masery_project/Settings/view_notification.dart';

class NotificationData {
  final String title;
  final String body;
  final AssetImage image;

  NotificationData({
    required this.title,
    required this.body,
    required this.image,
  });
}

class DisplayNotification extends StatefulWidget {
  final NotificationData notificationData;
  const DisplayNotification({Key? key, required this.notificationData}) : super(key: key);

  @override
  _DisplayNotificationState createState() => _DisplayNotificationState();
}

class _DisplayNotificationState extends State<DisplayNotification> {
  late Future<NotificationData> _notificationData;

  @override
  void initState() {
    super.initState();
    _notificationData = fetchNotificationData();
  }

  Future<NotificationData> fetchNotificationData() async {
    final url = Uri.parse('https://sgitjobs.com/MaseryShoppingNew/public/api/recentnotification');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final data = jsonResponse['data'];

        return NotificationData(
          title: data['title'],
          body: data['message'],
          image: AssetImage('assets/logo.png'), // Replace with your image asset path
        );
      } else {
        throw Exception('Failed to load notification data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Details'),
        centerTitle: true,
      ),
      body: FutureBuilder<NotificationData>(
        future: _notificationData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationDetailView(
                        title: snapshot.data!.title,
                        body: snapshot.data!.body,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    leading: Image(image: snapshot.data!.image),
                    title: Text(snapshot.data!.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                    subtitle: Text(
                      snapshot.data!.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


