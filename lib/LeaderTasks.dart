import 'package:flutter/material.dart';
import 'package:Bismuth/Upcoming_L.dart';
import 'package:Bismuth/tasksList.dart';
import 'package:Bismuth/newTasks.dart';
import './globalV.dart' as globals;

import 'clases/FieldGeologist.dart';
import 'clases/Task.dart';

///##################################################################################################################################################################
//here get the tasks list again
class LeaderTasks extends StatefulWidget {
  @override
  _LeaderTasksState createState() => _LeaderTasksState();
}

class _LeaderTasksState extends State<LeaderTasks> {
  Future<void> _addNewTask(
      String tasDep,
      String tasProg,
      String tasProj,
      String tasName,
      String tasSum,
      String tasObj,
      String tasDel,
      String tasExt,
      String tasInt,
      List<FieldGeologist> f) async {
    Task newTas = new Task(
      departmentName: tasDep,
      programName: tasProg,
      projectName: tasProj,
      leader: globals.leader,
      taskName: tasName,
      objectives: tasObj,
      summary: tasSum,
      AssignedFieldGeologist: f,
      deliverables: tasDel,
      externalSupport: tasExt,
      internalSupport: tasInt,
    );

    print(tasName);
    await globals.leader.addTask(newTas);
    setState(() {
      // globals.leader.addTask(newTas);
      //globals.TasksD.add(newTas);
      //request to add
      globals.leader.UcomingTasks.add(newTas);
    });
  }

  ///##################################################################################################################################################################

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        newTasks(_addNewTask),
      ],
    );
  }
}
