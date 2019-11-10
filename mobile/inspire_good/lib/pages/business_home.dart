import 'package:flutter/material.dart';
import 'package:inspire_good/data_bundle.dart';

businessHome(BuildContext context, DataBundle dataBundle) {
  return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 250),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Are you a ...',
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
              dataBundle.business = true;
              Navigator.pushNamed(context, '/log_or_sign', arguments: dataBundle);
            },
            child: Text(
              "Business",
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
              dataBundle.business = false;
              print(dataBundle.business);
              Navigator.pushNamed(context, '/log_or_sign', arguments: dataBundle);
            },
            child: Text(
              "Supporter",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
  );
}