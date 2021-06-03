import 'package:flutter/material.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:Bismuth/editableRec.dart';
import 'package:Bismuth/unEditableT.dart';
import './Upcoming_G.dart';
import './globalV.dart' as globals;
import 'package:flutter_svg/flutter_svg.dart';

import 'mains/signinDesign.dart';

class Completed_G extends StatefulWidget {
  Completed_G({
    Key key,
  }) : super(key: key);

  @override
  _Completed_GState createState() => _Completed_GState();
}

Future LOGOUT(context) async {
  await globals.Field.logout();
  globals.Field.currentTask = null;
  globals.Field.completedTasks = [];
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => signinDesign()));
}

class _Completed_GState extends State<Completed_G> {
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 0.0),
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
            offset: Offset(280.6, 13.0),
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
            offset: Offset(63.0, 13.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Upcoming_G(),
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
            offset: Offset(214.0, 0.0),
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
            offset: Offset(0.0, 0.0),
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
            offset: Offset(0.0, 50.5),
            child: Container(
                // height: 50,
                child: globals.Field.completedTasks.isEmpty
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
                                    'No records yet!',
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
                                      'It seems there is no record submitted yet, so start submitting some!',
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
                                            globals.Field.completedTasks[index],
                                            'geo')));
                              },
                              child: ListTile(
                                title: Text(
                                  globals.Field.completedTasks[index].taskName,
                                  //style: Theme.of(context).textTheme.,
                                ),
                                subtitle: Text(
                                  globals
                                      .Field.completedTasks[index].leader.name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: RaisedButton.icon(
                                    color: Colors.transparent,
                                    icon: Icon(
                                      Icons.receipt_outlined,
                                      color: Colors.blueGrey,
                                    ),
                                    elevation: 0,
                                    label: Text('Data Record'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => editableRec(
                                                  globals.Field
                                                      .completedTasks[index])));
                                      //requ
                                    }),
                              ),
                            ),
                          );
                        },
                        itemCount: globals.Field.completedTasks.length,
                      )),
          ),
        ],
      ),
    );
  }
}

const String _svg_ypifzs =
    '<svg viewBox="0.0 15.6 428.0 58.5" ><defs><filter id="shadow"><feDropShadow dx="0" dy="-10" stdDeviation="20"/></filter></defs><path  d="M 220.2159729003906 73.98484039306641 L 190.4391021728516 74.06639862060547 C 190.4391021728516 74.06639862060547 190.4313201904297 73.98841094970703 190.4167938232422 73.83831787109375 L 0.1368000060319901 72.90270233154297 L 0 16.04700088500977 L 139.2237091064453 16.04700088500977 C 139.2237091064453 16.04700088500977 166.8357086181641 16.09020042419434 186.0588073730469 16.04700088500977 C 200.8708801269531 15.46461868286133 211.9310760498047 15.56433200836182 220.7969818115234 15.75819492340088 C 227.5971374511719 15.83687877655029 234.9835357666016 15.95606231689453 242.4411010742188 16.04700088500977 C 265.0625915527344 15.42059993743896 288.0189208984375 16.04700088500977 288.0189208984375 16.04700088500977 L 427.24169921875 16.04700088500977 L 427.99951171875 73.41570281982422 L 236.8280334472656 73.93933868408203 C 236.8118896484375 74.02328491210938 236.8035125732422 74.06639862060547 236.8035125732422 74.06639862060547 L 220.2159729003906 73.98484039306641 Z" fill="#fafafa" fill-opacity="0.94" stroke="none" stroke-width="1" stroke-opacity="0.94" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_ezfmf2 =
    '<svg viewBox="15.0 222.8 388.0 1.0" ><path transform="translate(15.02, 222.3)" d="M 0 0.5 L 387.97705078125 0.5" fill="none" stroke="#eaecef" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
const String _svg_u14gaf =
    '<svg viewBox="214.0 120.0 215.0 7.0" ><path transform="translate(214.0, 120.0)" d="M 0 0 L 94 0 L 94 7 L 0 7 L 0 0 Z" fill="#37527c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(271.68, 120.0)" d="M 0 0 L 79 0 L 79 7 L 0 7 L 0 0 Z" fill="#426191" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(326.65, 120.0)" d="M 0 0 L 63 0 L 63 7 L 0 7 L 0 0 Z" fill="#6284b9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(380.0, 120.0)" d="M 0 0 L 49 0 L 49 7 L 0 7 L 0 0 Z" fill="#95afd8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d24b0f =
    '<svg viewBox="29.2 885.9 25.5 25.5" ><path transform="translate(29.18, 885.88)" d="M 21.73301124572754 16.45964622497559 C 20.34638977050781 15.07307434082031 18.69594764709473 14.04659557342529 16.89522361755371 13.42521953582764 C 18.82385444641113 12.09687995910645 20.0909252166748 9.873798370361328 20.0909252166748 7.360044956207275 C 20.0909252166748 3.3017258644104 16.78919982910156 0 12.73088073730469 0 C 8.672561645507812 0 5.370836734771729 3.3017258644104 5.370836734771729 7.360044956207275 C 5.370836734771729 9.873798370361328 6.637908458709717 12.09687995910645 8.566586494445801 13.42521953582764 C 6.765863418579102 14.04659557342529 5.11542272567749 15.07307434082031 3.728800296783447 16.45964622497559 C 1.324253916740417 18.86424446105957 -7.211696356534958e-06 22.06123733520508 -7.211696356534958e-06 25.46177673339844 L 1.98919415473938 25.46177673339844 C 1.98919415473938 19.53878211975098 6.807885646820068 14.72008991241455 12.73088073730469 14.72008991241455 C 18.65387725830078 14.72008991241455 23.47256851196289 19.53878211975098 23.47256851196289 25.46177673339844 L 25.46176910400391 25.46177673339844 C 25.46176910400391 22.06123733520508 24.13750839233398 18.86424446105957 21.73301124572754 16.45964622497559 Z M 12.73088073730469 12.73088836669922 C 9.769408226013184 12.73088836669922 7.360037803649902 10.32156848907471 7.360037803649902 7.360044956207275 C 7.360037803649902 4.398521900177002 9.769408226013184 1.989201307296753 12.73088073730469 1.989201307296753 C 15.69235420227051 1.989201307296753 18.10172462463379 4.398521900177002 18.10172462463379 7.360044956207275 C 18.10172462463379 10.32156848907471 15.69235420227051 12.73088836669922 12.73088073730469 12.73088836669922 Z" fill="#3a4f69" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j3yjv =
    '<svg viewBox="358.4 881.9 29.1 25.9" ><path transform="translate(358.36, 854.08)" d="M 28.79436874389648 38.044677734375 L 14.99841403961182 27.94356155395508 C 14.73238277435303 27.74881362915039 14.37096500396729 27.74881362915039 14.1050443649292 27.94356155395508 L 0.3089733123779297 38.044677734375 C -0.02800143882632256 38.29143524169922 -0.1012172847986221 38.76461410522461 0.1455451101064682 39.10158920288086 C 0.392307460308075 39.43856430053711 0.8655387759208679 39.51166534423828 1.202456593513489 39.2650146484375 L 14.55167198181152 29.49092864990234 L 27.90088653564453 39.26495742797852 C 28.03549575805664 39.36358261108398 28.19192886352539 39.41104888916016 28.34700202941895 39.41104888916016 C 28.57983779907227 39.41104888916016 28.80960273742676 39.30390167236328 28.95774078369141 39.10153198242188 C 29.20455932617188 38.76461410522461 29.13134384155273 38.29143524169922 28.79436874389648 38.044677734375 Z" fill="#3a4f69" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(305.12, 660.97)" d="M 78.38230133056641 232.5429992675781 C 77.96471405029297 232.5429992675781 77.6260986328125 232.8815612792969 77.6260986328125 233.2992095947266 L 77.6260986328125 245.3359985351562 L 71.57658386230469 245.3359985351562 L 71.57658386230469 238.7655487060547 C 71.57658386230469 236.6804962158203 69.88022613525391 234.9842529296875 67.79528045654297 234.9842529296875 C 65.71033477783203 234.9842529296875 64.01397705078125 236.6806182861328 64.01397705078125 238.7655487060547 L 64.01397705078125 245.3360443115234 L 57.96440124511719 245.3360443115234 L 57.96440124511719 233.2992553710938 C 57.96440124511719 232.8816223144531 57.62577819824219 232.5430603027344 57.20819854736328 232.5430603027344 C 56.79061508178711 232.5430603027344 56.45199203491211 232.8816223144531 56.45199203491211 233.2992553710938 L 56.45199203491211 246.0923156738281 C 56.45199203491211 246.5099487304688 56.79061508178711 246.8485107421875 57.20819854736328 246.8485107421875 L 64.77017974853516 246.8485107421875 C 65.16786193847656 246.8485107421875 65.49330139160156 246.5412750244141 65.52342987060547 246.1511993408203 C 65.52524566650391 246.1335296630859 65.52638244628906 246.1141967773438 65.52638244628906 246.0923156738281 L 65.52638244628906 238.7656097412109 C 65.52638244628906 237.5145111083984 66.544189453125 236.4967193603516 67.79528045654297 236.4967193603516 C 69.04637145996094 236.4967193603516 70.06417846679688 237.5145721435547 70.06417846679688 238.7656097412109 L 70.06417846679688 246.0923156738281 C 70.06417846679688 246.1140747070312 70.0653076171875 246.1330718994141 70.06713104248047 246.1505279541016 C 70.09691619873047 246.5408782958984 70.42247009277344 246.8485107421875 70.82038116455078 246.8485107421875 L 78.38236236572266 246.8485107421875 C 78.79999542236328 246.8485107421875 79.13856506347656 246.5099487304688 79.13856506347656 246.0923156738281 L 79.13856506347656 233.2992553710938 C 79.13850402832031 232.8815612792969 78.79993438720703 232.5429992675781 78.38230133056641 232.5429992675781 Z" fill="#3a4f69" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_8g1sfr =
    '<svg viewBox="19.0 48.5 19.3 20.0" ><path transform="translate(-1063.92, -3045.54)" d="M 1097.396728515625 3107.8916015625 C 1098.739990234375 3106.4150390625 1099.5673828125 3104.459716796875 1099.5673828125 3102.310791015625 C 1099.5673828125 3097.72802734375 1095.839233398438 3094 1091.2568359375 3094 C 1086.674072265625 3094 1082.946166992188 3097.72802734375 1082.946166992188 3102.310791015625 C 1082.946166992188 3106.89306640625 1086.674072265625 3110.62109375 1091.2568359375 3110.62109375 C 1093.135864257812 3110.62109375 1094.865600585938 3109.98681640625 1096.259521484375 3108.9306640625 L 1100.879272460938 3113.762939453125 C 1101.030029296875 3113.920654296875 1101.232543945312 3114 1101.43505859375 3114 C 1101.62744140625 3114 1101.818359375 3113.93017578125 1101.967651367188 3113.78662109375 C 1102.274047851562 3113.49267578125 1102.285522460938 3113.00537109375 1101.991577148438 3112.698486328125 L 1097.396728515625 3107.8916015625 Z M 1084.485595703125 3102.310791015625 C 1084.485595703125 3098.5771484375 1087.523315429688 3095.53955078125 1091.2568359375 3095.53955078125 C 1094.989501953125 3095.53955078125 1098.027954101562 3098.5771484375 1098.027954101562 3102.310791015625 C 1098.027954101562 3106.044189453125 1094.989501953125 3109.08154296875 1091.2568359375 3109.08154296875 C 1087.523315429688 3109.08154296875 1084.485595703125 3106.044189453125 1084.485595703125 3102.310791015625 Z" fill="#bec2ce" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_eif04d =
    '<svg viewBox="14.0 318.8 389.0 1.0" ><path transform="translate(14.0, 318.3)" d="M 0 0.5 L 389.0000305175781 0.5" fill="none" stroke="#eaecef" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
