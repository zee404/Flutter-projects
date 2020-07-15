import 'package:flutter/material.dart';
import 'package:e_blood/Shared/Constant.dart';

class PostRequest extends StatefulWidget {
  @override
  _PostRequestState createState() => _PostRequestState();
}

//variable declaration
final List<String> _bloodGroups = [
  'All',
  'A+',
  'A-',
  'B+',
  'B-',
  'AB+',
  'AB-',
  '0+',
  '0-'
];
String _currentBloodgroup;

////////////////////Decleration End////

class _PostRequestState extends State<PostRequest> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.02),
            child: new TextFormField(
              decoration: textInputDecorationPostRequest.copyWith(
                hintText: 'Enter patient Name',
                labelText: 'Patient Name :',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.02),
            child: new TextFormField(
              decoration: textInputDecorationPostRequest.copyWith(
                hintText: 'Enter the detail of patient disease ..',
                labelText: 'Disease Description  :',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.02),
            child: DropdownButtonFormField(
                decoration: textInputDecorationPostRequest.copyWith(
                  labelText: 'Patient Blood Group : ',
                ),
                value: _currentBloodgroup,
                items: _bloodGroups.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newvalue) {
                  setState(() {
                    _currentBloodgroup = newvalue;
                  });
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.02),
            child: new TextFormField(
              decoration: textInputDecorationPostRequest.copyWith(
                hintText: 'Enter location',
                labelText: 'City : ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
