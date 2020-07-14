import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthService {
  final _codeControler = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseUser _user =null ;
  Future signinWithPhone(String phone,BuildContext context)
  {
     
    try{
    _auth.verifyPhoneNumber(
      phoneNumber: phone, 
      timeout: Duration(seconds: 60), 
      verificationCompleted: (AuthCredential  crediential) async{
        AuthResult result = await _auth.signInWithCredential(crediential);
        FirebaseUser _user = result.user;
        //print("verification completed function .user id is "+user.uid);
        return _user;
      } ,
      verificationFailed: (AuthException  exception){
        print (exception.message);
      }, 
      codeSent: (String verificationid,[int forceRecendingToken])
      {
        showDialog(
          context:context,
          barrierDismissible: false,
          builder: (context) {
              return AlertDialog (
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
                      if (_user !=null)
                        {
                          return _user;
                        }
                      try {
                        
                      final code = _codeControler.text.trim();
                      AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationid, smsCode: code);
                      AuthResult result = await _auth.signInWithCredential(credential);
                    
                      FirebaseUser _user = result.user;
                       print("verification completed using code send function .user id is "+_user.uid);
                      return _user;
                      }catch (exception)
                      {
                        print('exception'+ exception);
                        return null;
                      }
                    },

                  ),
                ],
              );
          },
          
          );
    
      },
      codeAutoRetrievalTimeout: null
      
    );
    }catch(e){
      print('error'+ e);
      return null;
    }
    return null;
  }
   // sign in anom
  Future signInAnom () async {

    try {
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return user ;
    }
    catch(e)
    {
      print(e.toString());
      return null;

    }
  }
}
