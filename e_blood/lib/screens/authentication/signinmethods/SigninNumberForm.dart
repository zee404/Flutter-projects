import 'package:e_blood/placeAutoComplete/PlaceAutocomplete.dart';
import 'package:e_blood/screens/home/HomeScren.dart';
import 'package:e_blood/screens/home/home.dart';
import 'package:e_blood/service/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninNumberForm extends StatefulWidget {
  @override
  _SigninNumberFormState createState() => _SigninNumberFormState();
}

class _SigninNumberFormState extends State<SigninNumberForm> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: deviceSize.height * 0.1),
            width: deviceSize.width * 0.75,
            //Number Text Field    N U M B E R  F I E L D
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '301 2345678 ',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Phone Nunmber ',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'please Enter Valid nnumber eg:304*******';
                }
                return null;
              },
            ),
          ),

          // Button sing in with Phone   P H O N E B U T T O N

          Container(
            width: deviceSize.width * 0.50,
            margin: EdgeInsets.only(top: deviceSize.height * 0.1),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () async {
                dynamic result = await AuthService().signInAnom();
                print(result);
                if (result != null) {
                  print(result);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                'SIGNIN',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: deviceSize.height * 0.01),
            child: Text(
              'OR',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //sing in using phone  G M A I L
          Container(
            width: deviceSize.width * 0.55,
            margin: EdgeInsets.only(top: deviceSize.height * 0.01),
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              color: Colors.red,
              textColor: Colors.white,
              icon: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              label: Text(
                'SIGNIN Using GMAIL ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: deviceSize.height * 0.04),
            child: RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                  TextSpan(
                    text: 'Dont Have an Account ? ',
                    style: TextStyle(fontSize: 9.0),
                  ),
                  TextSpan(
                      text: 'Signup',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('tap working');
                        }),
                ])),
          )
        ],
      ),
    );
  }
}
