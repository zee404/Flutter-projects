import 'package:brue_crew/models/brew.dart';
import 'package:brue_crew/screens/home/brew_Tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class brewlist extends StatefulWidget {
  @override
  _brewlistState createState() => _brewlistState();
}

class _brewlistState extends State<brewlist> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<brew>>(context) ?? [];
  
   return ListView.builder(
     itemCount: brews.length,
     itemBuilder: (context ,index)
     {
       return brewTile(brews: brews[index]);
     },
     );

  }
}