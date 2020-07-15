import 'package:e_blood/screens/home/bottomNevigationBar/bottombuttonbar.dart';
import 'package:e_blood/screens/profile/profile.dart';
import 'package:e_blood/widgets/DonorList.dart';
import 'package:e_blood/widgets/DonorWidget.dart';
import 'package:e_blood/widgets/filter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widgets/DonorWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              "Profile",
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.white,
              ),
            ),
            preferredSize: null),
      ),
      body: Stack(
        children: <Widget>[
          DonorList(),
          Container(
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: FilterSearch(),
          ),
        ],
      ),
    );
  }
}
