import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialise() {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
        //called when your app is in the foreground and you recieve a push notification
        onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    },
        //when app closed and you open the app by clicking on the notification
        onLaunch: (Map<String, dynamic> message) async {
      print('onLaunch: $message');
    },
        //called when the app is in the background and you open it by clicking on the notification
        onResume: (Map<String, dynamic> message) async {
      print('onResume: $message');
    });
  }
}
