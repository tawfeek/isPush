import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingWiidget extends StatefulWidget {
  @override
  _MessagingWiidgetState createState() => _MessagingWiidgetState();
}

class _MessagingWiidgetState extends State<MessagingWiidget> {
  final FirebaseMessaging meesaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    meesaging.getToken().then((token) {
      print('token:' + token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
    );
  }
}
