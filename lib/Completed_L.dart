import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:Bismuth/unEditableT.dart';
import './globalV.dart' as globals;
import 'clases/Task.dart';
import 'mains/signinDesign.dart';

import 'package:adobe_xd/page_link.dart';

import 'package:Bismuth/Upcoming_L.dart';

import 'package:flutter_svg/flutter_svg.dart';

List<Task> newList = new List<Task>();

class Completed_L extends StatefulWidget {
  Completed_L({
    Key key,
  }) : super(key: key);

  @override
  _Completed_LState createState() => _Completed_LState();
}

Future<void> export(String taskID) async {
  // await globals.leader.getCompletedTasks();  await globals.leader.exportReport(taskID);
  OpenFile.open(await globals.leader.exportReport(taskID));
}

Future<void> gett() async {
  await globals.leader.getCompletedTasks();
}

Future<void> LOGOUT(context) async {
  await globals.leader.logout();
  globals.leader.UcomingTasks = [];
  globals.leader.CompletedTasks = [];
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => signinDesign()));
}

Future<void> f() async {
  print("SECOND");
  await gett();
  //print(globals.leader.CompletedTasks.toString() + "HELL");
  //return newList;
//  print("SECOND");
  print(globals.leader.CompletedTasks.toString() + "HELL");
}

Future navigateToSubPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => signinDesign()));
}

class _Completed_LState extends State<Completed_L> {
  @override
  Widget build(BuildContext context) {
    f();
    //setState(() {
    //  globals.leader.CompletedTasks = newList;
    //});
    // globals.leader.CompletedTasks = newList;
    print(globals.leader.CompletedTasks.toString() + "HEEL2");

    return Scaffold(
        appBar: AppBar(
          title: new Text(
            'Home Page',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              color: const Color(0xff3a4f69),
              letterSpacing: -0.5305882377624512,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          brightness: Brightness.light,
          backgroundColor: const Color(0xffffffff),
          actions: <Widget>[
            IconButton(
                //alignment: AlignmentDirectional.bottomEnd,
                color: Colors.indigo,
                icon: Icon(Icons.logout),
                onPressed: () {
                  LOGOUT(context);
                }),
          ],
        ),
        body: Stack(children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 1.0),
            child:
                // Adobe XD layer: 'bg' (shape)
                Container(
              width: 428.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14455b63),
                    offset: Offset(0, 12),
                    blurRadius: 16,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(280.6, 16.0),
            child: SizedBox(
              width: 89.0,
              child: Text(
                'COMPLETED',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 13,
                  color: const Color(0xff454f63),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(63.0, 16.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Upcoming_L(),
                ),
              ],
              child: SizedBox(
                width: 84.0,
                child: Text(
                  'UPCOMING',
                  style: TextStyle(
                    fontFamily: 'Gibson',
                    fontSize: 13,
                    color: const Color(0xb8454f63),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(214.0, 1.0),
            child:
                // Adobe XD layer: 'divider' (shape)
                Container(
              width: 1.0,
              height: 44.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                color: const Color(0xfff4f4f6),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 1.0),
            child:
                // Adobe XD layer: 'divider' (shape)
                Container(
              width: 428.0,
              height: 1.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.0),
                color: const Color(0xfff4f4f6),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(214.0, 40.0),
            child: SvgPicture.string(
              _svg_u14gaf,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
              offset: Offset(0.0, 45.5),
              child: Container(
                  //height: 50,
                  child: globals.leader.CompletedTasks.isEmpty
                      ? Column(
                          children: <Widget>[
                            SizedBox(
                              height: 300,
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'No reports yet!',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 24,
                                        color: Colors.grey[700],
                                        letterSpacing: -0.38588235473632815,
                                        fontWeight: FontWeight.w600,
                                        height: 1.375,
                                      ),

                                      //  style: Theme.of(context).textTheme.title,
                                    ),
                                    Container(
                                      width: 300,
                                      child: Text(
                                        'It seems there is no report submitted yet, so check back soon!',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
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
                          ],
                        )
                      //this has an infinite size so we can't conbine them wih column it should have a sized parent
                      : ListView.builder(
                          //using builder to get the best performance imposible because we don't know the list length and it may by too long
                          itemBuilder: (ctx, index) {
                            return Card(
                                elevation: 5,
                                margin: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                child: new InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => unEditableT(
                                                  globals.leader
                                                      .CompletedTasks[index],
                                                  'Leader')));
                                    },
                                    child: ListTile(
                                      title: Text(
                                        globals.leader.CompletedTasks[index]
                                            .taskName,

                                        //style: Theme.of(context).textTheme.,
                                      ),
                                      subtitle: Text(
                                        'Project Name: ' +
                                            globals.leader.CompletedTasks[index]
                                                .projectName,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      trailing: IconButton(
                                          icon: Icon(Icons.download_sharp),
                                          color: Colors.blue[900],
                                          onPressed: () => export(globals.leader
                                              .CompletedTasks[index].taskID)
                                          //requ),

                                          ),
                                    )));
                          },
                          itemCount: globals.leader.CompletedTasks.length,
                        ))),
        ]));
  }
}

const String _svg_u14gaf =
    '<svg viewBox="214.0 120.0 215.0 7.0" ><path transform="translate(214.0, 120.0)" d="M 0 0 L 94 0 L 94 7 L 0 7 L 0 0 Z" fill="#37527c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(271.68, 120.0)" d="M 0 0 L 79 0 L 79 7 L 0 7 L 0 0 Z" fill="#426191" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(326.65, 120.0)" d="M 0 0 L 63 0 L 63 7 L 0 7 L 0 0 Z" fill="#6284b9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(380.0, 120.0)" d="M 0 0 L 49 0 L 49 7 L 0 7 L 0 0 Z" fill="#95afd8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
