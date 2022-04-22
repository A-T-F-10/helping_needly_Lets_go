import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:helpings_needlys/core/utils/token.dart';
import 'package:helpings_needlys/sharedpreferances/keys_sharedpreferances.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Messages {
  String savetoken = '';
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

  sendMessge({required String? body, required String token}) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': "رسالة جديدة "
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': token,
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
    fbm.then((value) async {
      savetoken = value ?? '';
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(KeysSharedpreferances.TOKEN, value ?? '');
    });
  }
}
