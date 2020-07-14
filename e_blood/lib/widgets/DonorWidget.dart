import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // container  for profile image blood group and blood status
            Container(
              margin: EdgeInsets.all(screenSize.height * 0.01),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                        ),
                        radius: 25.0,
                      ),
                      Text('Blood Group :0+'),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        alignment: Alignment.bottomRight,
                        child: Text('Blood status'),
                      ),
                    ],
                  ),

                  // container for name age gender location
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name :Zeeshan Bashir',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Age :23',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Location:Abbottabad',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // button bar for call message and share buttons
            ButtonBar(
              children: <Widget>[
                ButtonTheme(
                  minWidth: screenSize.width * 0.25,
                  height: screenSize.height * 0.05,
                  child: RaisedButton.icon(
                      onPressed: () async {
                        await launch("tel:03040885424");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.green)),
                      color: Colors.white,
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                      label: Text('CALL',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  width: screenSize.width * 0.01,
                ),
                ButtonTheme(
                  minWidth: screenSize.width * 0.25,
                  height: screenSize.height * 0.05,
                  child: RaisedButton.icon(
                      onPressed: () async {
                        // Android
                        const uri = 'sms:+92 304 088 5424?body=hello%20there';
                        if (await canLaunch(uri)) {
                          await launch(uri);
                        } else {
                          // iOS
                          const uri = 'sms:0039-222-060-888';
                          if (await canLaunch(uri)) {
                            await launch(uri);
                          } else {
                            throw 'Could not launch $uri';
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.green)),
                      color: Colors.white,
                      icon: Icon(
                        Icons.message,
                        color: Colors.green,
                      ),
                      label: Text('Message',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  width: screenSize.width * 0.01,
                ),
                ButtonTheme(
                  minWidth: screenSize.width * 0.25,
                  height: screenSize.height * 0.05,
                  child: RaisedButton.icon(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.green)),
                      color: Colors.white,
                      icon: Icon(
                        Icons.share,
                        color: Colors.green,
                      ),
                      label: Text('Share Details ',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
