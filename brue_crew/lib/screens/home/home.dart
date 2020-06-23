import 'package:brue_crew/models/brew.dart';
import 'package:brue_crew/screens/home/setting_form.dart';
import 'package:brue_crew/services/Database.dart';
import 'package:brue_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brue_crew/screens/home/brew_list.dart';


class home extends StatelessWidget {
  
 final authservice _auth = authservice();
  @override
  Widget build(BuildContext context) {
    void _showSettingPanle ()
    {
      showModalBottomSheet(context: context, builder: (context)
      {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: settingForm(),
        );
      });
    }



    return StreamProvider<List<brew>>.value(
        value:  DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[200],
        appBar:  AppBar(
          backgroundColor: Colors.brown[400],
          title: Text("Home"),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(onPressed: () async{
              await _auth.signout() ;
            },
             icon: Icon(Icons.person), 
             label: Text("signout"),
            ),
            FlatButton.icon(
              icon:Icon(Icons.settings),
              label: Text("Setting"),
              
              onPressed: () => _showSettingPanle(),
               )
            
            ],
            
          ),

          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/coffee_bg.png'), 
                fit:BoxFit.cover,
                )
            ),
            child: brewlist()),
      ),
    );
  }
}