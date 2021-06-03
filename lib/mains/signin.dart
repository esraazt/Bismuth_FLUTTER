import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:Bismuth/Tasks.dart';
import 'dart:convert';

import 'package:Bismuth/Upcoming_G.dart';
import 'package:Bismuth/Upcoming_L.dart';
import 'package:Bismuth/clases/User.dart';
import '../globalV.dart' as globals;

//************************************************************************************************************/
class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  final email = TextEditingController();

  final pass = TextEditingController();

  Future<int> log() async {
    // user = new User();
    User user =
        new User(email: email.text.toString(), password: pass.text.toString());
    int i = await user.login();
    return i;
    // getData();
  }

  Future<void> Login() async {
    User user =
        new User(email: email.text.toString(), password: pass.text.toString());
    int j = await user.login();
    if (j == 400) {
      j = 0;
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(user),
      );
    } else if (j == 200) {
      print(user.jobType);
      if (user.jobType == "SingingCharacter.L") {
        globals.leader.SetUser(user);
        print("ZG");
        await globals.leader.getCompletedTasks();
        await globals.leader.getUpcomingTasks();
        j = 0;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Upcoming_L()));
      } else if (user.jobType == "SingingCharacter.F") {
        globals.Field.SetUser(user);
        j = 0;
        await globals.Field.getAllCompletedTasks();
        await globals.Field.getCurrentTask();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Upcoming_G()));
      }
    }
  }

  Widget _buildPopupDialog(User user) {
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

//********************************** INTIGRATION CODE ENDING  ***************************************** */
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(45),
      child: Column(
        children: <Widget>[
          Theme(
            data: new ThemeData(hintColor: Colors.white60),
            child: TextField(
              enableInteractiveSelection: false,
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
          FlatButton(
            onPressed: () async {
              await Login();
            },
            child: Text(
              'SIGN IN',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: const Color(0xffffffff),
                letterSpacing: -0.28800000000000003,
                fontWeight: FontWeight.w700,
                height: 6,
              ),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
