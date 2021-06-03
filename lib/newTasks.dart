import 'package:flutter/material.dart';
import 'package:Bismuth/Tasks.dart';
import 'package:Bismuth/Upcoming_L.dart';
import 'package:Bismuth/clases/FieldGeologist.dart';
import 'package:Bismuth/tasksList.dart';
import './MultiSelectDialogItem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './globalV.dart' as globals;
import 'clases/Task.dart';

String y = '';
List<Task> newList;
List<FieldGeologist> f = [];

class newTasks extends StatefulWidget {
  final Function addTas;

  newTasks(this.addTas);

  @override
  _newTasksState createState() => _newTasksState();
}

List<dynamic> data = List();

//****************************************** GET THE AVAILABLE FG end******************************************************

class _newTasksState extends State<newTasks> {
  final dep = TextEditingController();

  final prog = TextEditingController();

  final proj = TextEditingController();

  final leader = TextEditingController();

  final tName = TextEditingController();

  final inter = TextEditingController();

  final exter = TextEditingController();

  final del = TextEditingController();

  final obj = TextEditingController();

  final sum = TextEditingController();

  Future<void> gett() async {
    await globals.leader.getUpcomingTasks();
    print(globals.leader.UcomingTasks);
  }
  //Future<void> getAvaliableFieldGeologist() async {}

  //****************************************** GET THE AVAILABLE FG ******************************************************

  //Task newTask = new Task();

  List<MultiSelectDialogItem<int>> multiItem = List();
  List<MultiSelectDialogItem<int>> multiId = List();

  //Future<void> getData() async {
  // await globals.leader.getAvailableFieldGeologists();
  //}

  Future<void> _addTaskss() async {
    Task newTas = new Task(
      departmentName: dep.text,
      programName: prog.text,
      projectName: proj.text,
      leader: globals.leader,
      taskName: tName.text,
      objectives: obj.text,
      summary: sum.text,
      AssignedFieldGeologist: f,
      deliverables: del.text,
      externalSupport: exter.text,
      internalSupport: inter.text,
    );

    await globals.leader.addTask(newTas);
    await globals.leader.getUpcomingTasks();
    // gett();
    /*
  setState(() {
      //globals.leader.UcomingTasks.add(newTas);
      globals.leader.UcomingTasks = nwList;
    });*/
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Upcoming_L()));
    f = [];
  }

// here get the field geologists .. and save them into task assigned field geologists
  void _showMultiSelect(BuildContext context) async {
    //  Map<int, String> fGeo = {};
    multiItem = [];
    multiId = [];
    //idmulti=[];
    // await getData();
    // List<User> user = data.map((data) => User.fromJson(data)).toList();

    for (int i = 0; i < globals.leader.avaliableField.length; i++) {
      multiItem.add(MultiSelectDialogItem(
          i, globals.leader.avaliableField[i].name.toString()));
      multiId.add(MultiSelectDialogItem(
          i, globals.leader.avaliableField[i].userID.toString()));
    }

    //populateMultisele

    final items = multiItem;

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          //  initialSelectedValues: [0].toSet(),
        );
      },
    );
    //here to send to data
    print("selectedValues");
    print(selectedValues.toList());
    if (selectedValues.toList().length > 0) {
      for (int x in selectedValues.toList()) {
        print('wewwwww');
        print(x);
        f.add(new FieldGeologist(userID: int.parse(multiId[x].label)));
      }
      print(f[0].userID);
    }

    //newTask.AssignedFieldGeologist = f;
  }

  Task newTas;
  //****************************************** GET THE AVAILABLE FG END  ******************************************************
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
    newTas = Task(
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
    await globals.leader.addTask(newTas);
    //List<Task> nwList = await globals.leader.getUpcomingTasks();

    setState(() {
      //globals.leader.UcomingTasks.add(newTas);
      globals.leader.UcomingTasks.add(newTas);
    });
    //globals.leader.UcomingTasks = await globals.leader.getUpcomingTasks();
  }

  @override
  Widget build(BuildContext context) {
    //  gett();
    //setState(() {
    //globals.leader.UcomingTasks.add(newTas);
    // globals.leader.UcomingTasks = newList;
    // });
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(45),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'TASK DETAILS:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xeb000000),
                  letterSpacing: -0.32,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'DEPARTMENT:'),
              controller: dep,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'PROGRAM'),
              controller: prog,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'PROJECT'),
              controller: proj,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'TASK NAME'),
              controller: tName,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            Container(
              width: 386.0,
              height: 1.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0x6687858b),
              ),
            ),
            Container(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'SUMMARY:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xff000000),
                  letterSpacing: -0.38588235473632815,
                  fontWeight: FontWeight.w700,
                  height: 1.375,
                ),
              ),
            ),
            TextField(
              maxLength: 250,
              decoration: InputDecoration(labelText: 'Enter task summary '),
              controller: sum,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            Container(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'OBJECTIVES:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xff000000),
                  letterSpacing: -0.38588235473632815,
                  fontWeight: FontWeight.w700,
                  height: 1.375,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              maxLength: 250,
              decoration: InputDecoration(labelText: 'Enter task objective '),
              controller: obj,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            Container(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'TEAM',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xff202124),
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 7.0,
            ),
            RaisedButton(
              child: Text("Choose the team"),
              onPressed: () => _showMultiSelect(context),
            ),
            Container(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'SUPPORT SERVICES :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: const Color(0xff000000),
                  letterSpacing: -0.38588235473632815,
                  fontWeight: FontWeight.w700,
                  height: 1.375,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              maxLength: 250,
              decoration: InputDecoration(labelText: 'Internal Support:'),
              controller: inter,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            TextField(
              maxLength: 250,
              decoration: InputDecoration(labelText: 'External Support:'),
              controller: exter,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            TextField(
              //scrollController: del,
              maxLength: 250,
              decoration: InputDecoration(labelText: 'Deliverables:'),
              controller: del,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff707070),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text(
                'Creat Task',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              onPressed: () => _addTaskss(),
              color: Colors.lightBlue[900],
            ),
          ],
        ),
      ),
    );
  }
}
