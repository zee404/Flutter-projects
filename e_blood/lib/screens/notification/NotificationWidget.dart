import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: deviceSize.height * 0.01,
      ),
      width: deviceSize.width,
      height: deviceSize.height * 0.29,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //margin: EdgeInsets.only(left: deviceSize.width *0.02),
            padding: EdgeInsets.only(
              left: deviceSize.width * 0.02,
              top: deviceSize.height * 0.004,
            ),
            height: deviceSize.height * 0.04,
            width: deviceSize.width,
            color: Colors.grey[200],
            child: Text(
              'Blood Request From  *Name of patient *',
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: deviceSize.width * 0.02,
              top: deviceSize.height * 0.01,
              right: deviceSize.width * 0.01,
            ),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "Patient Name  :  ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Zeeshan Bashir   ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: deviceSize.width * 0.01, top: deviceSize.height * 0.01),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "Blood Group :  ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "O+",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                right: deviceSize.width * 0.01,
                left: deviceSize.width * 0.02,
                top: deviceSize.height * 0.01),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "Location :  ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Abbottabad   ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: deviceSize.width * 0.01, top: deviceSize.height * 0.01),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "Description :  ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        "Urgent Blood needed for thalesemia Ptient in ayub medical complex   ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                right: deviceSize.width * 0.01, top: deviceSize.width * 0.0),
            child: Row(
              children: <Widget>[
                Spacer(),
                Container(
                  height: deviceSize.height * 0.04,
                  width: deviceSize.height * 0.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                      border: Border.all(
                        color: Colors.green,
                      )),
                  child: Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: deviceSize.width * 0.07),
                Container(
                  height: deviceSize.height * 0.04,
                  width: deviceSize.height * 0.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                      border: Border.all(
                        color: Colors.green,
                      )),
                  child: Icon(
                    Icons.message,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: deviceSize.width * 0.04),
              ],
            ),
          )
        ],
      ),
    );
  }
}
