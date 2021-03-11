import 'package:flutter/material.dart';

class ProtocolItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          children: [
            // Checkbox(value: null, onChanged: null),
            Text("Test"),
          ],
        ),
      ),
    );
  }
}
