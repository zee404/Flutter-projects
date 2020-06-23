import 'package:brue_crew/models/user.dart';
import 'package:brue_crew/screens/authenticate/authenticate.dart';
import 'package:brue_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
  
  if (user == null){
    return Authenticate();
  } else {
    return home();
  }


}
}