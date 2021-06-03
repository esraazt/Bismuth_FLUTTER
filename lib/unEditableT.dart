import 'package:flutter/material.dart';
import './Upcoming_L.dart';
import 'RecordDe.dart';
import 'clases/Task.dart';

String x = '';

class unEditableT extends StatefulWidget {
  final Task tass;
  String pos;
  unEditableT(this.tass, this.pos);
  @override
  _unEditableTState createState() => _unEditableTState(tass, pos);
}

class _unEditableTState extends State<unEditableT> {
  String pos;
  final Task tass;
  _unEditableTState(this.tass, this.pos);
  //intialize it as F to make it true when the user is tap on text.

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
        leading: IconButton(
            //alignment: AlignmentDirectional.bottomEnd,
            color: const Color(0xff3a4f69),
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => Upcoming_L()),
              );
            }),
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
                    Row(children: <Widget>[
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
                      Text(
                        tass.departmentName,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 12,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    Container(
                      height: 5.0,
                    ),
                    Row(children: <Widget>[
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
                      Text(
                        tass.programName,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 12,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    Container(
                      height: 5.0,
                    ),
                    Row(children: <Widget>[
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
                      Text(
                        tass.projectName,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 12,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    Container(
                      height: 5.0,
                    ),
                    Row(children: <Widget>[
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
                      Container(
                        height: 20.0,
                      ),
                      Text(
                        tass.taskName,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 12,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]),
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
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        tass.summary,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 12,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
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
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        tass.objectives,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 12,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
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
                      height: 90,
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
                                return Card(
                                  elevation: 0,
                                  color: Colors.grey[300],
                                  margin: EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 5,
                                  ),
                                  child: new InkWell(
                                    child: ListTile(
                                      title: Text(
                                        tass.AssignedFieldGeologist[0].name
                                            .toString(),
                                        //style: Theme.of(context).textTheme.,
                                      ),
                                      subtitle: Text(
                                        tass.AssignedFieldGeologist[0].email
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      trailing: Text(
                                        'Geology',
                                        style: TextStyle(
                                          color: Colors.grey,
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
                    Row(children: <Widget>[
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
                      Expanded(
                        child: Text(
                          tass.internalSupport,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff707070),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ]),
                    Container(
                      height: 11.0,
                    ),
                    Row(children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Expanded(
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
                      ),
                      Text(
                        tass.externalSupport,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 12,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                    Container(
                      height: 11.0,
                    ),
                    Row(children: <Widget>[
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
                      Expanded(
                        child: Text(
                          tass.deliverables,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff707070),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),

          //this take the screen high -
          //  if (pos == 'geo')
          //  {
          /*  RaisedButton.icon(
            icon: Icon(Icons.add),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            textColor: Colors.white,
            label: Text(
              'Add record',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                letterSpacing: -0.5305882377624512,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RecordDe()));
            },
            //to drop the shadow
            elevation: 0,
            //to get rid of the extra margin
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.lightBlue[900],
          ),
          //
          */
        ],
      ),
    );
  }
}
