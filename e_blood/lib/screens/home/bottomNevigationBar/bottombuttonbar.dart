import 'package:e_blood/screens/home/home.dart';
import 'package:e_blood/screens/profile/profile.dart';

import 'package:flutter/material.dart';

class BottomNevbar extends StatefulWidget {
  @override
  _BottomNevbarState createState() => _BottomNevbarState();
}

final List<Widget> pages = [
  Home(),
  Profile(),
  Home(),
  Profile(),
];
int _currentindex = 0;
TextStyle optionStyle =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]);

class _BottomNevbarState extends State<BottomNevbar> {
  void _ontappeditem(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentindex,
      selectedItemColor: Colors.blueAccent,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Text('data'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notification_important,
          ),
          title: Text('data'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_box,
          ),
          title: Text('data'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_box,
          ),
          title: Text('data'),
        ),
      ],
      onTap: _ontappeditem,
    );
  }
}
