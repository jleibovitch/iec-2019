import 'package:flutter/material.dart';
import 'package:inspire_good/data_bundle.dart';

supporterSignUp(BuildContext context, DataBundle dataBundle) {
  TextEditingController eName = TextEditingController();
  TextEditingController eUser = TextEditingController();
  TextEditingController ePass = TextEditingController();
  TextEditingController eEmail = TextEditingController();
  TextEditingController ePhone = TextEditingController();
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

  TextField phone = TextField(
    decoration: InputDecoration(
      hintText: 'Phone Number',
    ),
    controller: ePhone,
  );
  TextField name = TextField(
    decoration: InputDecoration(
      hintText: 'Name',
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
            child: phone,
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
              dataBundle.phone = ePhone.text;

              SPost(user: dataBundle.user, pass: dataBundle.pass, email: dataBundle.email, name: dataBundle.name, phone: dataBundle.phone);
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

class SPost{
  final String user;
  final String pass;
  final String email;
  final String name;
  final String phone;

  SPost({this.user, this.pass, this.email, this.name,this.phone});

  factory SPost.fromJson(Map<String, dynamic> json) {
    return SPost(
      user: json['username'],
      pass: json['password'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}