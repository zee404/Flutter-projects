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
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('eblood'),

        // button on the app bar to nevigaet

        actions: <Widget>[
          FlatButton.icon(
            label: Text(""),
            icon: Icon(Icons.dehaze),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          DonorList(),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )),
            child: FilterSearch(),
          ),
        ],
      ),
    );
  }
}
