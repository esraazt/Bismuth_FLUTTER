import 'package:flutter/material.dart';
import 'package:Bismuth/Upcoming_G.dart';
import 'package:Bismuth/Upcoming_L.dart';
import 'package:Bismuth/clases/User.dart';
import '../globalV.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';

enum SingingCharacter { L, F }

class signUpp extends StatefulWidget {
  @override
  _signUppState createState() => _signUppState();
}

class _signUppState extends State<signUpp> {
  String _token;
  DateTime _expiryDate;
  String _userId;

  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();

  User user = new User();
  String url = 'http://127.0.0.1:5000/SignUp';
  Future<int> setData() async {
    //user = new User();
    user = new User(
        email: email.text.toString(),
        password: pass.text.toString(),
        jobType: _character.toString(),
        name: name.text.toString());
    int i = await user.SignUp();
    return i;
  }

  Widget _buildPopupDialog() {
    return new AlertDialog(
      title: const Text('Message'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(user.message),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  SingingCharacter _character = SingingCharacter.L;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(45),
      child: Column(
        children: <Widget>[
          Theme(
            data: new ThemeData(hintColor: Colors.white60),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  labelText: 'Name',
                  prefixIcon: Icon(
                    Icons.account_box_outlined,
                    color: Colors.white60,
                  )),
              controller: name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Theme(
            data: new ThemeData(hintColor: Colors.white60),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.white60,
                  )),
              controller: email,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Theme(
            data: new ThemeData(hintColor: Colors.white60),
            child: TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white60,
                  )),
              controller: pass,
            ),
          ),
          Container(
            height: 30.0,
          ),
          Text(
            'Position',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: const Color(0xffbec2ce),
            ),
            textAlign: TextAlign.left,
          ),
          ListTile(
            title: const Text('Leader',
                style: TextStyle(
                  color: const Color(0xffbec2ce),
                )),
            leading: Radio(
              value: SingingCharacter.L,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Geology',
                style: TextStyle(
                  color: const Color(0xffbec2ce),
                )),
            leading: Radio(
              value: SingingCharacter.F,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Container(
            height: 7.0,
          ),
          FlatButton(
            onPressed: () async {
              int j = await setData();
              if (j == 400) {
                j = 0;
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(),
                );
              } else if (j == 200) {
                if (user.jobType == "SingingCharacter.L") {
                  globals.leader.SetUser(user);
                  user = null;
                  j = 0;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Upcoming_L()));
                } else if (user.jobType == "SingingCharacter.F") {
                  globals.Field.SetUser(user);
                  user = null;
                  j = 0;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Upcoming_G()));
                }
              }
            },
            child: Text(
              'SIGN UP',
              style: TextStyle(
                fontFamily: 'Gibson',
                fontSize: 16,
                color: const Color(0xff959dad),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
