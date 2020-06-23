import 'package:flutter/material.dart';
import 'package:brue_crew/models/brew.dart';
import 'package:brue_crew/models/brew.dart';
class brewTile extends StatelessWidget {

  final brew brews;
  brewTile({this.brews});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top :8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6.0, 20.0, 0.0),
        child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/coffee_icon.png'),
          radius: 25.0,
          backgroundColor: Colors.brown[brews.strength],

        ) ,
        title: Text(brews.name),
        subtitle: Text('takes ${brews.suger} sugar(s)'),
        ),
      )
    );
  }
}