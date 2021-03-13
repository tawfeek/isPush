import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestScreen(title: "Patient's Images"),
    );
  }
}

class TestScreen extends StatefulWidget {
  TestScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
                child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 1800,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/image1.png',
                            width: 350, height: 250, fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/image2.png',
                            width: 350, height: 250, fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/image1.png',
                            width: 350, height: 250, fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ));
  }
}
