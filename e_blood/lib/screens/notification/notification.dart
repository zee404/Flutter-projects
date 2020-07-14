import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            width: deviceSize.width,
            height: deviceSize.height * 0.12,
            color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10, right: 15),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Zeeshan Bashir ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(" B +ve blood"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Location: Abbottabad"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Desdcription: Urgent need of blood in Ayub medical college"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      Icon(Icons.phone),
                      Icon(Icons.message),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
