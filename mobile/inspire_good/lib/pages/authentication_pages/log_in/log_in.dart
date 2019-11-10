import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inspire_good/data_bundle.dart';
import 'package:http/http.dart' as http;


logIn(BuildContext context, DataBundle dataBundle) {
  TextEditingController ePass = TextEditingController();
  TextEditingController eUser = TextEditingController();

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
              var resp = Post(user: dataBundle.user, pass: dataBundle.pass);

              Navigator.pushNamed(context, '/view_all_jobs', arguments: dataBundle);
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

class Post{
  final String user;
  final String pass;

  Post({this.user, this.pass});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      user: json['username'],
      pass: json['password'],
    );
  }
}
