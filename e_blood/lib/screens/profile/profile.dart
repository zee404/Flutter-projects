import 'package:date_format/date_format.dart';
import 'package:e_blood/Shared/Constant.dart';
import 'package:e_blood/screens/home/home.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DateTime dateOfBirth;
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
  int _value = 0;
  String _bleedDate;
  String _bleedDat = 'o+';
  bool _edit = false;

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
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('eblood')),

        // button on the app bar to nevagite

        // actions: <Widget>[
        //   FlatButton.icon(
        //     icon: Icon(Icons.home),
        //     label: Text("Home"),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => Home()),
        //       );
        //     },
        //   )
        // ],
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
                    margin: EdgeInsets.only(top: screenSize.height * 0.02),
                    child: new TextFormField(
                      initialValue: 'Raja zeeshan',
                      decoration: textInputDecorationProfile.copyWith(
                        labelText: 'Name :',
                      ),
                    ),
                  ),
                  //Age form field
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.02),
                    child: new TextFormField(
                      initialValue: '23',
                      keyboardType: TextInputType.number,
                      decoration: textInputDecorationProfile.copyWith(
                        labelText: 'Age :',
                      ),
                    ),
                  ),

                  //blood group drop down

                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.02),
                    child: DropdownButtonFormField(
                        decoration: textInputDecorationProfile.copyWith(
                          labelText: 'Blood Group : $_bleedDat',
                        ),
                        value: _currentBloodgroup ?? _bleedDate,
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
                    margin: EdgeInsets.only(top: screenSize.height * 0.02),
                    child: new TextFormField(
                      initialValue: 'ABBOTTABAD',
                      decoration: textInputDecorationProfile.copyWith(
                        labelText: 'City : ',
                      ),
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
                            margin:
                                EdgeInsets.only(top: screenSize.height * 0.02),
                            child: TextFormField(
                              readOnly: true,
                              decoration: textInputDecorationProfile.copyWith(
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
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now(),
                                    ).then((date) {
                                      setState(() {
                                        dateOfBirth = date;
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
          ],
        ),
      ),
    );
  }
}
