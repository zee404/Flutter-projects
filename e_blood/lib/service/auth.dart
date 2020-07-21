import 'package:e_blood/model/users.dart';
import 'package:e_blood/screens/home/HomeScren.dart';
import 'package:e_blood/screens/profile/profile.dart';
import 'package:e_blood/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _codeControler = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseUser _user = null;
  dynamic newUserResult;

  User _userFormFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFormFirebaseUser);
  }

// ---------------------------------------------##FBE5E7
  void onAuthenticate(String phoneNo, BuildContext context) async {
    print(
        "------------------- NewUserresult: " + newUserResult.user.toString());

    if (newUserResult != null &&
        await DatabaseService().phoneNoExist(phoneNo) == true) {
      print("------------- BRAVO 6 GOING DARK");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else if (newUserResult != null &&
        await DatabaseService().phoneNoExist(phoneNo) == false) {
      DatabaseService(uid: newUserResult).updateUserData({
        'userID': newUserResult,
        'userPhone': phoneNo,
      });
      print("--------------------- User data updated for uid: " +
          newUserResult.toString() +
          " and Phone no is : " +
          phoneNo.toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(),
        ),
      );
    }
  }

// ---------------------------------------------
  Future signinWithPhone(String phone, BuildContext context) {
    try {
      _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: Duration(seconds: 120),

          /// ---  ON SUCCESSFULL COMPLETE
          verificationCompleted: (AuthCredential crediential) async {
            newUserResult = await _auth.signInWithCredential(crediential);

            FirebaseUser user = newUserResult.user;
            User(uid: user.uid);

            //print("verification completed function .user id is "+user.uid);
            if (user != null) {
              _userFormFirebaseUser(user);
              onAuthenticate(phone, context);
            }
          },

          /// ---  ON FAILED
          verificationFailed: (AuthException exception) {
            print(exception.message);
          },

          /// ---  ON CODE SENT
          codeSent: (String verificationid, [int forceRecendingToken]) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text('Enter The Code .'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeControler,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Confirm'),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        if (_user != null) {
                          return _user;
                        }
                        try {
                          final code = _codeControler.text.trim();
                          AuthCredential credential =
                              PhoneAuthProvider.getCredential(
                            verificationId: verificationid,
                            smsCode: code,
                          );
                          newUserResult =
                              await _auth.signInWithCredential(credential);

                          FirebaseUser _user = newUserResult.user;
                          if (newUserResult != null) {
                            print(
                                "verification completed using code send function .user id is " +
                                    _user.uid);
                            onAuthenticate(phone, context);
                          } else {
                            print("Phone authenticaiton result is null");
                          }
                        } catch (exception) {
                          print('exception' + exception.toString());
                          return null;
                        }
                      },
                    ),
                  ],
                );
              },
            );
          },
          codeAutoRetrievalTimeout: null);
    } catch (e) {
      print('error' + e);
      return null;
    }
    return null;
  }

// UPDATE value in the data base

  // sign in anom
  Future signInAnom() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
