import 'package:flutter/material.dart';

class NotificationDetail extends StatelessWidget {
  NotificationDetail();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      height: 100,
      child: Text('There is no Notification',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
    ));
  }
}
