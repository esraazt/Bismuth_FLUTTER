import 'package:flutter/material.dart';
import 'package:Bismuth/Add_task_L.dart';
import 'package:Bismuth/tasksList.dart';
import 'package:Bismuth/upbar.dart';
import './globalV.dart' as globals;
import 'clases/Task.dart';

//bool y = (globals.tasks[0].name == null);

class Upcoming_L extends StatefulWidget {
  @override
  _Upcoming_LState createState() => _Upcoming_LState();
}

List<Task> newList;

class _Upcoming_LState extends State<Upcoming_L> {
  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Add_task_L()));
  }

  Widget _buildPopupDialog() {
    return new AlertDialog(
      title: const Text('ERROR'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            //  width: 90.5,
            //height: 90.1,
            child: Text('There\'s lack of Field geologeist at the moment'),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('OK'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('in the upcom');
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          upbar(),
          // tasksList(globals.leader.UcomingTasks),
          Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //this take the screen high -
              Expanded(
                child: Column(),
              ),
              RaisedButton.icon(
                icon: Icon(Icons.add),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                textColor: Colors.white,
                label: Text(
                  'Create a task',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    letterSpacing: -0.5305882377624512,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
                onPressed: () async {
                  await globals.leader.getAvailableFieldGeologists();
                  print(globals.leader.avaliableField.length);
                  if (globals.leader.avaliableField.length <= 0) {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog());
                    });
                  } else {
                    navigateToSubPage(context);
                  }
                },
                //to drop the shadow
                elevation: 0,
                //to get rid of the extra margin
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Colors.lightBlue[900],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
