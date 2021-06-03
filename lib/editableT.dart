import 'package:flutter/material.dart';
import './Upcoming_L.dart';

import './globalV.dart' as globals;

import 'package:flutter_svg/flutter_svg.dart';
import 'clases/Task.dart';

String x = '';

class editableT extends StatefulWidget {
  final Task tass;
  editableT(this.tass);
  @override
  _editableTState createState() => _editableTState(tass);
}

bool edit = false;

class _editableTState extends State<editableT> {
  final Task tass;
  _editableTState(this.tass);
  //intialize it as F to make it true when the user is tap on text.
  bool _isEditingText = true;
  //to get the updated value from the text field.
  TextEditingController _depCon;
  TextEditingController _progCon;
  TextEditingController _pojCon;
  TextEditingController _ledCon;
  TextEditingController _namCon;
  TextEditingController _sumCon;
  TextEditingController _objCon;
  TextEditingController _innCon;
  TextEditingController _exxCon;
  TextEditingController _delCon;
  String newDep,
      newProg,
      newNam,
      newProj,
      newSum,
      newObj,
      newInn,
      newExx,
      newDEl;

  var _isInit = true;
  List<Task> newTasks = new List<Task>();
  Future<void> getData() async {
    if (newObj.toString() == 'null') {
      newObj = '';
    }
    if (newSum.toString() == 'null') {
      newSum = '';
    }
    if (newExx.toString() == 'null') {
      newExx = '';
    }
    if (newDEl.toString() == 'null') {
      newDEl = '';
    }
    if (newInn.toString() == 'null') {
      newInn = '';
    }
    if (newDep.toString() == 'null') {
      newDep = '';
    }
    if (newProg.toString() == 'null') {
      newProg = '';
    }
    if (newProj.toString() == 'null') {
      newProj = '';
    }
    if (newNam.toString() == 'null') {
      newNam = '';
    }
    Task editTask = new Task(
        taskName: newNam.toString(),
        objectives: newObj.toString(),
        summary: newSum.toString(),
        externalSupport: newExx.toString(),
        deliverables: newDEl.toString(),
        internalSupport: newInn.toString(),
        departmentName: newDep.toString(),
        programName: newProg.toString(),
        projectName: newProj.toString(),
        taskID: tass.taskID);

    // globals.leader.editTask(editTask);

    await globals.leader.editTask(editTask);

    await globals.leader.getUpcomingTasks();
    print('wwwwww');
    setState(() {
      globals.leader.UcomingTasks = newTasks;
    });
    if (edit == false) {
      print('fffffff');
      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => Upcoming_L()));
      edit = false;
    } else if (edit == true) {
      print('ttttttttt');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Upcoming_L()));
      edit = false;
    }
  }

//initialize and dispose the controllers to unsubscribe and cancel all animations, streams.
  @override
  void initState() {
    super.initState();

    _depCon = TextEditingController(text: tass.departmentName.toString());
    _progCon = TextEditingController(text: tass.programName.toString());
    _pojCon = TextEditingController(text: tass.projectName.toString());
    _ledCon = TextEditingController(text: globals.leader.name);
    _namCon = TextEditingController(text: tass.taskName);
    _sumCon = TextEditingController(text: tass.summary);
    _objCon = TextEditingController(text: tass.objectives);
    _innCon = TextEditingController(text: tass.internalSupport);
    _exxCon = TextEditingController(text: tass.externalSupport);
    _delCon = TextEditingController(text: tass.deliverables);
    newDep = tass.departmentName;
    newProg = tass.programName;
    newNam = tass.taskName;
    newProj = tass.projectName;
    newSum = tass.summary;
    newObj = tass.objectives;
    newInn = tass.internalSupport;
    newExx = tass.externalSupport;
    newDEl = tass.deliverables;
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final tasId = ModalRoute.of(context).settings.arguments as String;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _depCon.dispose();
    _progCon.dispose();
    _pojCon.dispose();
    _ledCon.dispose();
    _namCon.dispose();
    _sumCon.dispose();
    _objCon.dispose();
    _innCon.dispose();
    _exxCon.dispose();
    _delCon.dispose();

    super.dispose();
  }

  Widget _editTitleTextField(
      String teee, TextEditingController conn, String type) {
    //getTasks();

    if (_isEditingText)
      return Center(
        //so at first it is uneditable text
        //child: Container(
        // padding: EdgeInsets.symmetric(),
        child: TextField(
            onSubmitted: (newValue) {
              setState(() {
                teee = newValue;
                initState();
                _isEditingText = true;
              });
            },
            autofocus: true,
            //  new value is assigned to initial Text
            //which is the updated value getting from the controler
            controller: conn,
            onChanged: (text) {
              edit = true;
              if (type == 'DEPARTMENT') {
                newDep = text;
              }
              if (type == 'PROGRAM') {
                newProg = text;
              }
              if (type == 'PROJECT') {
                newProj = text;
              }
              if (type == 'TASK NAME') {
                newNam = text;
              }
              if (type == 'SUMMARY') {
                // if (text.toString() == 'null') {
                // newSum = "";
                //}
                newSum = text;
              }
              if (type == 'OBJECTIVES') {
                newObj = text;
              }
              if (type == 'Internal') {
                newInn = text;
              }
              if (type == 'External') {
                newExx = text;
              }
              if (type == 'DELIVERABLES') {
                newDEl = text;
              }
            }),
        //  ),
      );

    // return conn.text;
    // but if the user tapped the text
    return InkWell(
      onTap: () {
        setState(() {
          // print(teee + 'Edit');
          //set it as true to enable the editing
          _isEditingText = true;
        });
      },
      child: Text(
        teee,
        style: TextStyle(
          fontFamily: 'Helvetica Neue',
          fontSize: 14,
          color: const Color(0xff707070),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  Future<void> _onSubmitTap() async {
    await getData();
    /* setState(() {
      Task editTask = new Task(
          taskName: newNam.toString(),
          objectives: newObj.toString(),
          summary: newSum.toString(),
          externalSupport: newExx.toString(),
          deliverables: newDEl.toString(),
          internalSupport: newInn.toString(),
          departmentName: newDep.toString(),
          programName: newProg.toString(),
          projectName: newProj);
      Navigator.pop(context, editTask);
    });*/
    //Navigator.pop(context);
    await globals.leader.getUpcomingTasks();
  }

  @override
  Widget build(BuildContext context) {
    // getTasks();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: Text(
          'Task Details',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            color: const Color(0xff3a4f69),
            letterSpacing: -0.5305882377624512,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        actions: <Widget>[
          IconButton(
              //alignment: AlignmentDirectional.bottomEnd,
              color: Colors.indigo,
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => Upcoming_L()),
                );
              }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 11.0,
                    ),
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
                    Container(
                      height: 11.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'DEPARTMENT: ',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    _editTitleTextField(
                        tass.departmentName, _depCon, 'DEPARTMENT'),
                    Container(
                      height: 5.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'PROGRAM: ',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    _editTitleTextField(tass.programName, _progCon, 'PROGRAM'),
                    Container(
                      height: 5.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'PROJECT: ',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    _editTitleTextField(tass.projectName, _pojCon, 'PROJECT'),
                    Container(
                      height: 5.0,
                    ),
                    Container(
                      height: 5.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'TASK NAME: ',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    _editTitleTextField(tass.taskName, _namCon, 'TASK NAME'),
                    Container(
                      height: 15.0,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 5,
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
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 11.0,
                    ),
                    _editTitleTextField(tass.summary, _sumCon, 'SUMMARY'),
                    Container(
                      height: 15.0,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 5,
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
                    Container(
                      height: 11.0,
                    ),
                    _editTitleTextField(tass.objectives, _objCon, 'OBJECTIVES'),
                    Container(
                      height: 10.0,
                    ),
                    Container(
                      height: 15.0,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'TEAM :',
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 230,
                      child: tass.AssignedFieldGeologist == null
                          ? Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 180,
                                  width: 25,
                                ),
                                Text(
                                  'No Assigned Geologist!',
                                  //  style: Theme.of(context).textTheme.title,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          //this has an infinite size so we can't conbine them wih column it should have a sized parent
                          : ListView.builder(
                              //using builder to get the best performance imposible because we don't know the list length and it may by too long
                              itemBuilder: (ctx, index) {
                                return
                                    //using builder to get the best performance imposible because we don't know the list length and it may by too long
                                    Card(
                                  elevation: 1,
                                  color: Colors.grey[300],
                                  margin: EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 5,
                                  ),
                                  child: new InkWell(
                                    child: ListTile(
                                      title: Text(
                                        tass.AssignedFieldGeologist[index].name
                                            .toString(),
                                        //style: Theme.of(context).textTheme.,
                                      ),
                                      subtitle: Text(
                                        tass.AssignedFieldGeologist[index].email
                                            .toString(),
                                        style: TextStyle(
                                          // fontStyle: ,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      trailing: Text(
                                        'Geology',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: tass.AssignedFieldGeologist.length,
                            ),
                    ),
                    Container(
                      height: 10.0,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 5,
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
                    Container(
                      height: 11.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Internal Support : ',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    _editTitleTextField(
                        tass.internalSupport, _innCon, 'Internal'),
                    Container(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'External Support : ',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    _editTitleTextField(
                        tass.externalSupport, _exxCon, 'External'),
                    Container(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'DELIVERABLES : ',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    _editTitleTextField(
                        tass.deliverables, _delCon, 'DELIVERABLES'),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                          width: 59,
                        ),
                        FlatButton(
                          child: Text('CANCEL'),
                          textColor: Colors.lightBlue[900],
                          onPressed: _onCancelTap,
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        FlatButton(
                          child: Text('DONE'),
                          textColor: Colors.lightBlue[900],
                          onPressed: _onSubmitTap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
