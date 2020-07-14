import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      centerTitle: true,
      title: Text('eblood'),

      // button on the app bar to nevigaet

      // actions: <Widget>[
      //   FlatButton.icon(
      //     label: Text(""),
      //     icon: Icon(Icons.dehaze),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => Profile()),
      //       );
      //     },
      //   )
      // ],
    );
  }
}
