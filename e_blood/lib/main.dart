import 'package:e_blood/model/users.dart';
import 'package:e_blood/screens/authentication/signin.dart';
import 'package:e_blood/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Signin(),
      ),
    );
  }
}
