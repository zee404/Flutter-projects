import 'package:brue_crew/screens/wrapper.dart';
import 'package:brue_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brue_crew/models/user.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<User>.value(
       value:authservice().user  ,
          child: MaterialApp(
        home: wrapper()
      ),
    );
  }
}
