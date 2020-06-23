import 'package:brue_crew/screens/authenticate/Signin.dart';
import 'package:brue_crew/screens/authenticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn =true;

  void toggleSignIn()
  {
    setState(() {
      showSignIn = !showSignIn ;
    });
  }
  @override
  Widget build(BuildContext context) {
   
   if (showSignIn)
   {
    return Signin(toggleview: toggleSignIn);
   }else {
     return register(toggleview: toggleSignIn);
   }
  }
}