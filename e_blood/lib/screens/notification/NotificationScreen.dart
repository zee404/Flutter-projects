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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('eblood'),

        // button on the app bar to nevigaet

        
      ),
      body: NotificationList(),
    );
  }
}