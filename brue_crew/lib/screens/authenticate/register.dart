import 'package:brue_crew/shared/constant.dart';
import 'package:brue_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brue_crew/services/auth.dart';

class register extends StatefulWidget {

  final Function toggleview ;

  register({this.toggleview});

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {

  bool loading = false; 
  final authservice _auth= authservice();
  final _formkey = GlobalKey<FormState>();

 String email ='';
 String password ='';
 String error ='';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text("Sign up to App"),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
              widget.toggleview();
          }, 
          icon: Icon(
          Icons.person
          ), 
          label: Text(
          "Sign in"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
        child: Expanded(
          flex: 1,
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
                    validator: (val)=> val.isEmpty ? 'enter at 6 chrs password' :null,

                  onChanged:(val) => password =val,
                ),
                SizedBox(height: 20.0),
                RaisedButton(onPressed: () async{
                   if (_formkey.currentState.validate())
                   {
                     setState(() {
                       loading= true;
                     });
                     dynamic result = await _auth.registerWithEmailAndPassword(email.trim(), password);
                     if (result == null)
                     {
                       
                        setState(() {
                          loading = false;
                          error =' please enter valid email .';
                        });
                     }
                   }
                    
                },
                color: Colors.green[300],
                child: Text(
                "Register",
                style: TextStyle(
                color: Colors.white
                ),
                ),
                ),
                  SizedBox(height: 10.0,),
                  Text(error,
                  style: TextStyle(color:Colors.red),),
              ],
            )),
        ),
      ),

    );
  }
}