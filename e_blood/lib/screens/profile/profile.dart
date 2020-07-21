import 'package:date_format/date_format.dart';
import 'package:e_blood/Shared/Constant.dart';
import 'package:e_blood/model/users.dart';
import 'package:e_blood/screens/home/home.dart';
import 'package:e_blood/service/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // variable Decleration ///////////////////

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

  int _value = 0;
  String _bleedDate;
  String _bleedDat = 'o+';
  bool _edit = false;

  String _currentBloodgroup;
  String _currentName;
  String _currentCity;
  DateTime _lastDonationDate;
  //chanig app bar color and text dynamically ///
  Color appbarBGColor = Colors.red;
  Color appBarForegroundColor = Colors.white;
  String titleText = 'Profile';

  void changeappabar() {
    setState(() {
      appbarBGColor = Colors.white;
      appBarForegroundColor = Colors.blue;
      titleText = 'Edit Profile';
    });
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019));
    if (picked != null) setState() {}
    _bleedDate = picked.toString();
  }

  final _formkey = GlobalKey<FormState>();

  //// decleration ends here /////////////////////

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    final screenSize = MediaQuery.of(context).size;
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).getUserData,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          UserData user = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: appbarBGColor,
              leading: Container(),
              title: Text(
                'eblood',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: appBarForegroundColor,
                ),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                  child: Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 19.0,
                      color: appBarForegroundColor,
                    ),
                  ),
                  preferredSize: null),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 40.0,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //name formfield
                        Container(
                          margin:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: new TextFormField(
                            readOnly: !_edit,
                            initialValue: user.userName,
                            decoration: textInputDecorationProfile.copyWith(
                              labelText: 'Name :',
                            ),
                            validator: (val) => val.isEmpty
                                ? 'Please Enter a Valid Name'
                                : null,
                            onChanged: (val) =>
                                setState(() => _currentName = val),
                          ),
                        ),
                        //Age form field
                        Container(
                          margin:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: new TextFormField(
                            readOnly: !_edit,
                            initialValue: '23',
                            keyboardType: TextInputType.number,
                            decoration: textInputDecorationProfile.copyWith(
                              labelText: 'Age :',
                            ),
                          ),
                        ),

                        //blood group drop down

                        Container(
                          margin:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: DropdownButtonFormField(
                              decoration: textInputDecorationProfile.copyWith(
                                labelText: 'Blood Group : $_bleedDat',
                              ),
                              value: _currentBloodgroup ?? user.userBG,
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

                        //city form field
                        Container(
                          margin:
                              EdgeInsets.only(top: screenSize.height * 0.02),
                          child: new TextFormField(
                            readOnly: !_edit,
                            initialValue: user.userLocation,
                            decoration: textInputDecorationProfile.copyWith(
                              labelText: 'City : ',
                            ),
                            validator: (val) =>
                                val.isEmpty ? 'Please Enter a City Name' : null,
                            onChanged: (val) =>
                                setState(() => _currentCity = val),
                          ),
                        ),
                        //last bleed date. B L E E D  D A T E
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              //borderRadius: BorderRadius.all(Radius.circular(50)),
                              child: Container(
                                height: screenSize.height * 0.1,
                                width: screenSize.width * 0.95,
                                color: Colors.white.withOpacity(0.7),
                                //
                                // >>>>>>>>> last bleed date
                                //
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: screenSize.height * 0.02),
                                  child: TextFormField(
                                    initialValue: formatDate(_lastDonationDate,
                                        [yy, '-', MM, '-', d]),
                                    readOnly: true,
                                    decoration:
                                        textInputDecorationProfile.copyWith(
                                      hintText: '',
                                      labelText: 'Bleed Date : ',
                                      //
                                      // >>>>>>>>> Calender Icon ( F U N C T I O N A L )
                                      //
                                      suffixIcon: IconButton(
                                        color: Colors.black.withOpacity(0.7),
                                        icon: Icon(
                                          Icons.calendar_today,
                                          size: 35.0,
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                        onPressed: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1960),
                                            lastDate: DateTime.now(),
                                          ).then((date) {
                                            setState(() {
                                              _lastDonationDate = date;
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                        visible: !_edit ?? true,
                        child: Container(
                          width: screenSize.width * 0.40,
                          margin: EdgeInsets.only(
                            top: screenSize.height * 0.02,
                          ),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {
                              setState(() {
                                _edit = true;
                                changeappabar();
                              });
                            },
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Text(
                              'Edit info',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _edit ?? true,
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
                              'Save Info ',
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
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
