import 'package:flutter/material.dart';
import 'package:inspire_good/data_bundle.dart';

businessSignUp(BuildContext context, DataBundle dataBundle) {
  TextEditingController eName = TextEditingController();
  TextEditingController eUser = TextEditingController();
  TextEditingController ePass = TextEditingController();
  TextEditingController eEmail = TextEditingController();
  TextEditingController eAddress = TextEditingController();
  TextField user = TextField(
    decoration: InputDecoration(
      hintText: 'Username',
    ),
    controller: eUser,
  );

  TextField pass = TextField(
    decoration: InputDecoration(
      hintText: 'Password',
    ),
    controller: ePass,
  );

  TextField email = TextField(
    decoration: InputDecoration(
      hintText: 'Email',
    ),
    controller: eEmail,
  );

  TextField address = TextField(
    decoration: InputDecoration(
      hintText: 'Business Address',
    ),
    controller: eAddress,
  );
  TextField name = TextField(
    decoration: InputDecoration(
      hintText: 'Business Name',
    ),
    controller: eName,
  );
  return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 250),
        Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: user,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: pass,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: email,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: name,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: address,
          ),
        ),
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
              dataBundle.user = eUser.text;
              dataBundle.pass = ePass.text;
              dataBundle.email = eEmail.text;
              dataBundle.name = eName.text;
              dataBundle.address = eAddress.text;

              BPost(user: dataBundle.user, pass: dataBundle.pass);
              // Navigator
            },
            child: Text(
              "Login",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
  );
}

class BPost{
  final String user;
  final String pass;
  final String email;
  final String name;
  final String address;

  BPost({this.user, this.pass, this.email, this.name,this.address});

  factory BPost.fromJson(Map<String, dynamic> json) {
    return BPost(
      user: json['username'],
      pass: json['password'],
      email: json['email'],
      name: json['name'],
      address: json['location'],
    );
  }
}