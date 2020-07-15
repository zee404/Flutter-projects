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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Container(),
        title: Text(
          'eblood',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            child: Text(
              "Request",
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.white,
              ),
            ),
            preferredSize: null),
      ),
      body: Container(
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
              height: screenSize.height * 0.2,
              child: new TextFormField(
                // textAlign: TextAlign.right,
                maxLength: 200,
                decoration: textInputDecorationPostRequest.copyWith(
                  contentPadding: new EdgeInsets.symmetric(
                    vertical: 50.0,
                  ),
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
            Center(
              child: Container(
                width: screenSize.width * 0.40,
                margin: EdgeInsets.only(
                  top: screenSize.height * 0.02,
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {},
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text(
                    'Update Info ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
