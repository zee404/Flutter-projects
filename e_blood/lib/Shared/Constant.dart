import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(
    color: Colors.green,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);

final textInputDecorationProfile = InputDecoration(
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
);

final textInputDecorationPostRequest = InputDecoration(
  hintText: 'hint Text ',
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  fillColor: Colors.white,
  labelText: 'Label Text ',
  labelStyle: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.green, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(color: Colors.green, width: 2.0),
  ),
);
final textInputDecorationPostRequestDescription = InputDecoration(
  hintText: 'hint Text ',
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  fillColor: Colors.white,
  labelText: 'Label Text ',
  labelStyle: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.green, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(color: Colors.green, width: 2.0),
  ),
);
