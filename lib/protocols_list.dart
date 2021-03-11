import 'package:flutter/material.dart';
import 'package:ispush_flutter_app/protocol_item.dart';

class ProtocolsList extends StatefulWidget {
  @override
  _ProtocolsListState createState() => _ProtocolsListState();
}

class _ProtocolsListState extends State<ProtocolsList> {
  List<bool> checks = [];
  List<String> topics = [
    "Abdomen",
    "Aorta CTA/Abdomen",
    "SHAN SCAN UNDER 50 ZDOM/Thorax",
    "Neck CTA/Neck",
    "RENALES HDx/3",
    "THO1_Tssiv",
    "THO4_EP",
    "Brain Axial PPP3/Head",
    "HEAD CTA PERFUSION 6/5/Head"
  ];

  @override
  void initState() {
    for (var topic in topics) {
      checks.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580.0,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: topics.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              value: checks[index],
              onChanged: (bool newvalue) {
                setState(() {
                  checks[index] = newvalue;
                });
              },
              title: Text(topics[index]),
            );
          }),
    );
  }
}
