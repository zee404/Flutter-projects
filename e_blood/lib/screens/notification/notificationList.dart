import 'package:e_blood/screens/notification/NotificationWidget.dart';
import 'package:flutter/material.dart';

import '../../widgets/DonorWidget.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return NotificationWidget();
        });
  }
}