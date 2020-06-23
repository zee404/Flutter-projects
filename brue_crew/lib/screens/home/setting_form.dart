import 'package:brue_crew/models/user.dart';
import 'package:brue_crew/models/userdata.dart';
import 'package:brue_crew/services/Database.dart';
import 'package:brue_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brue_crew/shared/constant.dart';
import 'package:provider/provider.dart';

class settingForm extends StatefulWidget {
  @override
  _settingFormState createState() => _settingFormState();
}

class _settingFormState extends State<settingForm> {
 
 final _formkey = GlobalKey<FormState>();
 final List<String> sugars =['0','1','2','3','4'];

//formvalues
String _currentName;
String _currentSugars;
int _currentStrength;

 
 @override
  Widget build(BuildContext context) {
       final user = Provider.of<User>(context);
    // here we are using stremabuilder instead of provider .
    //we can simply use this. because we are not using this streamin any other widget
    
    return StreamBuilder<UserData>(

      stream: DatabaseService(uid:user.uid ).userdata,

      builder: (context, snapshot) {
        if (snapshot.hasData) {

        UserData user = snapshot.data;

        return Form(
          key: _formkey,
        child: Column(
          children: <Widget>[
            Text("update your settings",
            style: TextStyle( fontSize: 20.0),
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              initialValue: user.name,
              decoration: textInputDecoration,
              validator: (val)=> val.isEmpty ? 'please enter a name' : null,
              onChanged: (val) => setState(()=> _currentName = val),
            
            ),
            SizedBox(height: 10.0,),

            //dropdown 
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _currentSugars ?? user.suger,
              items: sugars.map((sugar){
                return DropdownMenuItem (
                  value: sugar,
                  child: Text('$sugar sugars'),
                );
              }).toList(), onChanged: (val) =>setState(()=> _currentSugars = val),
              ),
              //slider
              Slider(
                value: (_currentStrength ?? user.strength).toDouble(), 
                activeColor: Colors.brown[_currentStrength ?? user.strength],
                inactiveColor: Colors.brown[_currentStrength ?? user.strength],
                min: 100.0,
                max: 900.0,
                divisions: 8,
                
                
                 onChanged: (val) => setState(() => _currentStrength = val.round(),),
                 ),

              //raised button
              RaisedButton(
                color: Colors.green,
                child: Text('Update',
                style:TextStyle(color:Colors.white),
                ),
                onPressed: () async{
                 if (_formkey.currentState.validate())
                 {
                   await DatabaseService(uid: user.uid).updateUser(
                     _currentName ?? user.name,
                     _currentSugars ?? user.suger,
                     _currentStrength ?? user.strength
                     );
                  Navigator.pop(context);
                 }
                },
              )
          ],
        ),

        );
        }
        else {
          return Loading();
        }
      }
    );
  }
}