import 'package:e_blood/screens/authentication/signinmethods/SigninNumberForm.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _phoneControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: deviceSize.height * 0.35,
              width: deviceSize.width,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: deviceSize.width * 0.05,
                right: deviceSize.width * 0.05,
                top: deviceSize.height * 0.20,
              ),
              height: deviceSize.height * 0.7,
              width: deviceSize.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: deviceSize.height * 0.03),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SigninNumberForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
