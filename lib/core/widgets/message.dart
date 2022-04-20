import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class Message {
  ios() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  sendMessge({required String? body, required String? title}) async {
    String serverToken =
        'AAAAnp_T1LI:APA91bHRG5SXzgLoYoKoRIENaT8XC0f_VbyplDW1JZ3isKeQtHycAN_Keae3t8-hYK0jB1hbtgyUE-uxpVkv9Qmb8wBBgJdjwG3cYQfvOP6oSBZF2pC1rrEKysi_mwShwwoiYn0vENoc';

    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': body, 'title': title},
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': await FirebaseMessaging.instance.getToken(),
        },
      ),
    );
  }

  getInitialMessageT() async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {}
  }

  onMessageOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  }

  tokens() {
    Future<String?> fbm = FirebaseMessaging.instance.getToken();
    String? savetoken;
    print('====get====');
    fbm.then((value) {
      savetoken = value;
    });
  }
}
