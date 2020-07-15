import 'package:flutter/material.dart';
import 'package:e_blood/screens/notification/NotificationList.dart';
import 'package:e_blood/screens/notification/NotificationWidget.dart';
import '';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: Container(
            width: screenSize.width * 0.3,
            child: Text(
              'eblood',
              style: TextStyle(
                fontSize: 20.0,
              ),
            )),
        title: Text(
          'Notification',
          style: TextStyle(fontSize: 15.0),
        ),
        centerTitle: true,
        // button on the app bar to nevigaet
      ),
      body: NotificationList(),
    );
  }
}
