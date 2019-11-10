import 'package:flutter/material.dart';
import 'package:inspire_good/data_bundle.dart';

logOrSign(BuildContext context, DataBundle dataBundle) {
  return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 250),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Would you like to ...',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 70),
        Center(
          child: RaisedButton(
            color: Colors.orange,
            textColor: Colors.white,
            padding: EdgeInsets.all(12.0),
            splashColor: Colors.orangeAccent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4.0),
            ),
            onPressed: () {
                Navigator.pushReplacementNamed(context, "/log_in", arguments: dataBundle);
            },
            child: Text(
              "Log In",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: Text('or'),
        ),
        SizedBox(height: 5),
        Center(
          child: RaisedButton(
            color: Colors.orange,
            textColor: Colors.white,
            padding: EdgeInsets.all(12.0),
            splashColor: Colors.orangeAccent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4.0),
            ),
            onPressed: () {
              print(dataBundle.business);
              if (dataBundle.business == true) {
                Navigator.pushReplacementNamed(context, "/business_sign_up", arguments: dataBundle);
              } else {
                Navigator.pushReplacementNamed(context, "/supporter_sign_up", arguments: dataBundle);
              }
            },
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
  );
}