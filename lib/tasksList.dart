import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Bismuth/editableT.dart';
import './globalV.dart' as globals;
import 'Tasks.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'clases/Task.dart';

///##################################################################################################################################################################
//here ya wed get the tasks listt

class tasksList extends StatefulWidget {
  final List<Task> tasks;

  /// insteade of this

  //final Function gett;
  tasksList(this.tasks);

  @override
  _tasksListState createState() => _tasksListState();
}

List<Task> newList;

class _tasksListState extends State<tasksList> {
  Future<void> _deleteTaskss(String id) async {
    await globals.leader.deleteTask(id);
    setState(() {
      globals.leader.UcomingTasks.removeWhere((task) => (task.taskID == id));
    });
  }

  Future<void> gett() async {
    await globals.leader.getUpcomingTasks();
    print(globals.leader.UcomingTasks);
  }

  Widget _buildPopupDialog(String k) {
    return new AlertDialog(
      title: const Text('Warning!'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Are you sure you want to delete this task?'),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cancel'),
        ),
        new FlatButton(
          onPressed: () {
            _deleteTaskss(k);
            Navigator.pop(context);
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Delete'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('in the list');
    // gett();
    //setState(() {
    //globals.leader.UcomingTasks = newList;
    //});
    return Container(
      height: 780,
      child: globals.leader.UcomingTasks.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                  width: 25,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'No tasks yet!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            color: Colors.grey[700],
                            letterSpacing: -0.38588235473632815,
                            fontWeight: FontWeight.w600,
                            height: 1.375,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            'More task will be shown here for you as they are added, so start Create some!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Colors.grey[700],
                              letterSpacing: -0.38588235473632815,
                              fontWeight: FontWeight.w600,
                              height: 1.375,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          //this has an infinite size so we can't conbine them wih column it should have a sized parent
          : ListView.builder(
              //using builder to get the best performance imposible because we don't know the list length and it may by too long
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: new InkWell(
                    onTap: () {
                      // Navigator.of(context).pushNamed( editableT(taskk: tasks[index]).routeName,argumets: tasks[index].id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                editableT(globals.leader.UcomingTasks[index]),
                          ));
                    },
                    child: ListTile(
                      title: Text(
                        globals.leader.UcomingTasks[index].taskName.toString(),
                      ),
                      subtitle: Text(
                        'Project Name: ' +
                            globals.leader.UcomingTasks[index].projectName,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialog(
                              globals.leader.UcomingTasks[index].taskID),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: globals.leader.UcomingTasks.length,
            ),
    );
  }
}
