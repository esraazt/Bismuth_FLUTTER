import 'package:flutter/material.dart';
import 'package:Bismuth/LeaderTasks.dart';
import 'package:Bismuth/Tasks.dart';
import './globalV.dart' as globals;
import './Upcoming_L.dart';
import 'Tasks.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class Add_task_L extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          title: Text(
            'ADD TASK',
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
                color: Colors.indigo,
                icon: Icon(Icons.arrow_back_sharp),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => Upcoming_L()),
                  );
                })
          ]),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(0.0, 79.0),
              child: SvgPicture.string(
                _svg_w4hu7g,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            //point bar
            Transform.translate(
              offset: Offset(401.7, 60.4),
              child:
                  // Adobe XD layer: 'Oval' (shape)
                  Container(
                width: 4.6,
                height: 4.6,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  color: const Color(0xbc030202),
                ),
              ),
            ),
            //bar line
            Transform.translate(
              offset: Offset(0.0, 79.0),
              child: SvgPicture.string(
                _svg_gqurb2,
                allowDrawingOutsideViewBox: true,
              ),
            ),

            SingleChildScrollView(child: LeaderTasks()),

            //null
            Transform.translate(
              offset: Offset(33.5, 689.0),
              child: SvgPicture.string(
                _svg_bv7ucy,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ],
        ),
      ),

      /*
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        //color: const Color(0xff3a4f69) ,
        onPressed: null),
       */
    );
  }
}

const String _svg_w4hu7g =
    '<svg viewBox="0.0 79.0 375.0 1.0" ><path transform="translate(0.0, 78.0)" d="M 0 1 L 375 1" fill="none" stroke="#eaecef" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
const String _svg_gqurb2 =
    '<svg viewBox="0.0 79.0 428.0 1.0" ><path transform="translate(0.0, 78.0)" d="M 0 1 L 428 1" fill="none" stroke="#eaecef" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
const String _svg_bv7ucy =
    '<svg viewBox="33.5 689.0 9.0 8.0" ><path transform="translate(33.0, 688.0)" d="M 3.788000106811523 9 C 3.480066299438477 8.999837875366211 3.189379453659058 8.857813835144043 3.000000238418579 8.614999771118164 L 0.7119998931884766 5.614999771118164 C 0.4797775745391846 5.334514617919922 0.4183778762817383 4.949969291687012 0.5517110824584961 4.611116886138916 C 0.6850442886352539 4.27226448059082 0.992031991481781 4.032673835754395 1.353124141693115 3.985648393630981 C 1.714216828346252 3.938623428344727 2.072328329086304 4.091598510742188 2.288000106811523 4.385000228881836 L 3.787999868392944 6.375999927520752 L 7.711999893188477 1.384999990463257 C 7.927671909332275 1.091598868370056 8.285782814025879 0.9386247396469116 8.64687442779541 0.9856500029563904 C 9.007966041564941 1.03267514705658 9.314953804016113 1.272265434265137 9.448287010192871 1.611117601394653 C 9.581620216369629 1.94996976852417 9.520220756530762 2.334514617919922 9.288000106811523 2.614999771118164 L 4.576000213623047 8.614999771118164 C 4.386620998382568 8.857813835144043 4.09593391418457 8.999837875366211 3.788000106811523 9 Z" fill="#fafafa" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
