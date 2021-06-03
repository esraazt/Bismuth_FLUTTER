import 'package:flutter/material.dart';
import 'package:Bismuth/RecordDe.dart';
import 'package:Bismuth/unEditableT.dart';
import 'globalV.dart' as globals;
import 'mains/signinDesign.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:Bismuth/Completed_G.dart';

class Upcoming_G extends StatelessWidget {
  Future navigateToSubPage(context) async {
    //Navigator.of(context).pushNamed(RecordDe.routeName);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RecordDe()));
  }

  Future LOGOUT(context) async {
    await globals.Field.logout();
    globals.Field.currentTask = null;
    globals.Field.completedTasks = [];
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => signinDesign()));
  }

  Future<void> getData() async {
    await globals.Field.getAllCompletedTasks();
    await globals.Field.getCurrentTask();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              alignment: AlignmentDirectional.bottomEnd,
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
          offset: Offset(280.6, 15.0),
          child: PageLink(
            links: [
              PageLinkInfo(
                transition: LinkTransition.Fade,
                ease: Curves.easeOut,
                duration: 0.3,
                pageBuilder: () => Completed_G(),
              ),
            ],
            child: SizedBox(
              width: 89.0,
              child: Text(
                'COMPLETED',
                style: TextStyle(
                  fontFamily: 'Gibson',
                  fontSize: 13,
                  color: const Color(0xff959dad),
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
              color: const Color(0xfff4f4f9),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(63.0, 15.0),
          child: SizedBox(
            width: 84.0,
            child: Text(
              'UPCOMING',
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

        //ombre line
        Transform.translate(
          offset: Offset(0.0, 38.5),
          child: SvgPicture.string(
            _svg_26j2re,
            allowDrawingOutsideViewBox: true,
          ),
        ),

        Transform.translate(
          offset: Offset(0.0, 45.5),
          child: Container(
              // height: 50,
              child: globals.Field.currentTask == null
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

                                  //  style: Theme.of(context).textTheme.title,
                                ),
                                Container(
                                  width: 300,
                                  child: Text(
                                    'It seems there is no task added yet, so check back !',
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => unEditableT(
                                          globals.Field.currentTask, 'geo')));
                            },
                            child: ListTile(
                              title: Text(
                                globals.Field.currentTask.taskName,
                              ),
                              subtitle: Text(
                                "Task Leader: " +
                                    globals.Field.currentTask.leader.name,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: RaisedButton.icon(
                                icon: Icon(Icons.edit),
                                label: Text('Data Record'),
                                color: Theme.of(context).cardColor,
                                onPressed: () {
                                  navigateToSubPage(context);
                                },
                                elevation: 0,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 1,
                    )),
        ),
      ]),
    );
  }
}

const String _svg_26j2re =
    '<svg viewBox="0.0 161.5 428.0 764.5" ><path transform="translate(0.0, 161.46)" d="M 0 0 L 94 0 L 94 7 L 0 7 L 0 0 Z" fill="#37527c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(57.68, 161.46)" d="M 0 0 L 79 0 L 79 7 L 0 7 L 0 0 Z" fill="#426191" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(112.65, 161.46)" d="M 0 0 L 63 0 L 63 7 L 0 7 L 0 0 Z" fill="#6284b9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(166.0, 161.46)" d="M 0 0 L 49 0 L 49 7 L 0 7 L 0 0 Z" fill="#95afd8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><filter id="shadow"><feDropShadow dx="0" dy="-10" stdDeviation="20"/></filter></defs><path transform="translate(0.0, 851.93)" d="M 220.2009735107422 73.98503875732422 L 190.4394226074219 74.06666564941406 C 190.4394226074219 74.06666564941406 190.4380645751953 73.98883819580078 190.4357299804688 73.83867645263672 L 0.1364811956882477 72.90296936035156 L 0 16.04726791381836 L 139.2238616943359 16.04726791381836 C 139.2238616943359 16.04726791381836 164.3916015625 16.68716812133789 184.4181976318359 6.121167182922363 C 195.183349609375 1.233183741569519 205.3117980957031 -0.1475669890642166 213.6213073730469 0.0121600478887558 C 221.9310150146484 -0.1475669890642166 232.0595245361328 1.233183741569519 242.8241271972656 6.121167182922363 C 262.8507385253906 16.68716812133789 288.0194702148438 16.04726791381836 288.0194702148438 16.04726791381836 L 427.2423400878906 16.04726791381836 L 428 73.41506958007812 L 236.8049774169922 73.93949127197266 C 236.8036346435547 74.0235595703125 236.8028869628906 74.06666564941406 236.8028869628906 74.06666564941406 L 220.2009735107422 73.98503875732422 Z" fill="#fafafa" fill-opacity="0.94" stroke="none" stroke-width="1" stroke-opacity="0.94" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
