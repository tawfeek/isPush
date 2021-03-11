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
  final FirebaseMessaging meesage = FirebaseMessaging();

  void firebaseTrigger(BuildContext context) async {
    meesage.configure(
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
      print('onResume: body part ' + message['Body']);
    });
  }

  @override
  void initState() {
    super.initState();
    meesage.getToken().then((token) {
      print('token:' + token);
    });

    firebaseTrigger(context);
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
                // Text("Please pick a topic / topics"),
                // ProtocolsList()
              ],
            ),
          ),
        )));
  }
}
