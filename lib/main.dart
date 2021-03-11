import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ispush_flutter_app/protocols_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Welcome to isPush'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseMessaging fcm = FirebaseMessaging();
  String bodyNotification = "";
  String updatedText = "";

  void firebaseTrigger(BuildContext context) async {
    fcm.configure(
        //called when your app is in the foreground and you recieve a push notification
        onMessage: (Map<String, dynamic> message) async {
      //  updateText(message['Body'].toString());
      print('onMessage: body part $message');
    },
        //when app closed and you open the app by clicking on the notification
        onLaunch: (Map<String, dynamic> message) async {
      //  updateText(message['Body'].toString());
      print('onLaunch: body part $message');
    },
        //called when the app is in the background and you open it by clicking on the notification
        onResume: (Map<String, dynamic> message) async {
      // updateText(message['Body'].toString());
      print('onResume: body part $message');
    });
  }

  updateText(String text) {
    bodyNotification = text;
  }

  @override
  void initState() {
    super.initState();
    fcm.getToken().then((token) {
      print('token:' + token);
    });

    firebaseTrigger(context);
  }

  @override
  void setState(fn) {
    //r updatedText = bodyNotification;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text("body from notification: " + updatedText),
                // ProtocolsList()
              ],
            ),
          ),
        )));
  }
}
