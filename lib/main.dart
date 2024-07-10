import 'dart:convert';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'Settings/notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Always initialize Awesome Notifications
  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeIsolateReceivePort();
  runApp(const MyApp());
  // Start listening for notification events
  NotificationController.startListeningNotificationEvents();
}

///  *********************************************
///     NOTIFICATION CONTROLLER
///  *********************************************
///
class NotificationController {
  static ReceivedAction? initialAction;

  ///  *********************************************
  ///     INITIALIZATIONS
  ///  *********************************************
  ///
  static Future<void> initializeLocalNotifications() async {
    try {
      await AwesomeNotifications().initialize(
          null, //'resource://drawable/res_app_icon',//
          [
            NotificationChannel(
                channelKey: 'alerts',
                channelName: 'Alerts',
                channelDescription: 'Notification tests as alerts',
                playSound: true,
                onlyAlertOnce: true,
                groupAlertBehavior: GroupAlertBehavior.Children,
                importance: NotificationImportance.High,
                defaultPrivacy: NotificationPrivacy.Private,
                defaultColor: Colors.deepPurple,
                ledColor: Colors.deepPurple)
          ],
          debug: true);

      // Get initial notification action is optional
      initialAction = await AwesomeNotifications()
          .getInitialNotificationAction(removeFromActionEvents: false);
    } catch (e) {
      print("Error initializing notifications: $e");
    }
  }

  static ReceivePort? receivePort;
  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate')
      ..listen(
              (silentData) => onActionReceivedImplementationMethod(silentData));

    // This initialization only happens on main isolate
    IsolateNameServer.registerPortWithName(
        receivePort!.sendPort, 'notification_action_port');
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS LISTENER
  ///  *********************************************
  ///  Notifications events are only delivered after call this method
  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS
  ///  *********************************************
  ///
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      // For background actions, you must hold the execution until the end
      print(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
      // await executeLongTaskInBackground();
    } else {
      // this process is only necessary when you need to redirect the user
      // to a new page or use a valid context, since parallel isolates do not
      // have valid context, so you need redirect the execution to main isolate
      if (receivePort == null) {
        print(
            'onActionReceivedMethod was called inside a parallel dart isolate.');
        SendPort? sendPort =
        IsolateNameServer.lookupPortByName('notification_action_port');

        if (sendPort != null) {
          print('Redirecting the execution to main isolate process.');
          sendPort.send(receivedAction);
          return;
        }
      }

      return onActionReceivedImplementationMethod(receivedAction);
    }
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/notification-page',
            (route) =>
        (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction);
  }

  ///  *********************************************
  ///     REQUESTING NOTIFICATION PERMISSIONS
  ///  *********************************************
  ///
  static Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;
    BuildContext context = MyApp.navigatorKey.currentContext!;
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Get Notified!',
                style: Theme.of(context).textTheme.titleLarge),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/animated-bell.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                    'Allow Awesome Notifications to send you beautiful notifications!'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Deny',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () async {
                    userAuthorized = true;
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Allow',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.deepPurple),
                  )),
            ],
          );
        });
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  // ///  *********************************************
  // ///     BACKGROUND TASKS TEST
  // ///  *********************************************
  // static Future<void> executeLongTaskInBackground() async {
  //   print("starting long task");
  //   await Future.delayed(const Duration(seconds: 4));
  //   final url = Uri.parse("http://google.com");
  //   final re = await http.get(url);
  //   print(re.body);
  //   print("long task done");
  // }

  ///  *********************************************
  ///     NOTIFICATION CREATION METHODS
  ///  *********************************************
  ///
  static Future<void> createNewNotification(String title, String body) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1, // -1 is replaced by a random number
          channelKey: 'alerts',
          title: title,
          body: body,
          notificationLayout: NotificationLayout.BigPicture,
          payload: {'notificationId': '1234567890'}),
    );
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // The navigator key is necessary to navigate using static methods
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static Color mainColor = const Color(0xFF9D50DD);

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  // This widget is the root of your application.

  static const String routeHome = '/', routeNotification = '/notification-page';

  @override
  void initState() {
    fetchAndNotify();
    super.initState();
  }

  List<Route<dynamic>> onGenerateInitialRoutes(String initialRouteName) {
    List<Route<dynamic>> pageStack = [];
    pageStack.add(MaterialPageRoute(
        builder: (_) => const HomePage()));
    if (initialRouteName == routeNotification &&
        NotificationController.initialAction != null) {
      pageStack.add(MaterialPageRoute(
          builder: (_) => NotificationPage(
              receivedAction: NotificationController.initialAction!)));
    }
    return pageStack;
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(
            builder: (_) => const HomePage());
      case routeNotification:
        ReceivedAction receivedAction = settings.arguments as ReceivedAction;
        return MaterialPageRoute(
            builder: (_) => NotificationPage(receivedAction: receivedAction));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awesome Notifications',
      navigatorKey: MyApp.navigatorKey,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }

  Future<void> fetchAndNotify() async {
    final response = await http.get(Uri.parse('https://sgitjobs.com/MaseryShoppingNew/public/api/recentnotification'));
    print(response.body);
    if (response.statusCode == 200) {

      final responseData = jsonDecode(response.body);
      final data = responseData['data'];
      final title = data['title'];
      final body = data['message'];

      NotificationController.createNewNotification(title, body);
    } else {
      throw Exception('Failed to load notification data');
    }
  }
}
