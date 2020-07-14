import 'package:e_blood/screens/home/home.dart';
import 'package:e_blood/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _ontappeditem(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> pages = [
    Home(),
    Home(),
    Profile(),
    Profile(),
  ];
  int _currentindex = 0;
  TextStyle optionStyle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageStorage(
            child: pages[_currentindex],
            bucket: bucket,
          ),
        ],
      ),

      //nev bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        selectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notification_important,
            ),
            title: Text('Notifications'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
            ),
            title: Text('Post Request'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            title: Text('Profile'),
          ),
        ],
        onTap: _ontappeditem,
      ),
    );
  }
}
