import 'package:brue_crew/services/auth.dart';
import 'package:brue_crew/shared/constant.dart';
import 'package:brue_crew/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {


  final Function toggleview ;

  Signin({this.toggleview});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {


final authservice _auth= authservice();
final _formkey = GlobalKey<FormState>();

bool loading= false;
 String email ='';
 String password ='';
 String error ='';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text("Sign in to App"),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.toggleview();
          }, 
          icon: Icon(
          Icons.person
          ), 
          label: Text(
          "register"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val)=> val.isEmpty ? 'enter an valid email' :null,
                onChanged: (val)
                {
                    setState(() {
                      email =val;
                    });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
               validator: (val)=> val.length <6 ? 'enter atleast 6 chrs long password' :null,

                onChanged:(val) => password =val,
              ),
              SizedBox(height: 20.0),
              RaisedButton(onPressed: () async{
                if (_formkey.currentState.validate()){
                  setState(() {
                    loading = true ;
                  });
                  dynamic result = await _auth.signInWithEmailAndPassword(email.trim(), password);
                  if (result == null)
                  {
                    setState(() {
                      error ='invalid email or password';
                      loading= false ;
                    });
                  } 
                }
              

              },
              color: Colors.green[300],
              child: Text(
              "Sign in",
              style: TextStyle(
              color: Colors.white
              ),
              ),
              ),
              SizedBox(height: 10.0),
              Text(
                error,
                style: TextStyle(color:Colors.red),
              )
            ],
          )),
      ),

    );
  }
}