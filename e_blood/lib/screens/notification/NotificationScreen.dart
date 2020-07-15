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
        backgroundColor: Colors.red,
        leading: Container(),
        title: Text(
          'eblood',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            child: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.white,
              ),
            ),
            preferredSize: null),
      ),
      body: NotificationList(),
    );
  }
}
