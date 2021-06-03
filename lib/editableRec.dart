import 'package:flutter/material.dart';
import 'package:Bismuth/Completed_G.dart';
import 'package:Bismuth/rocks%20info/CALCITE.dart';
import 'package:Bismuth/rocks%20info/DACITE.dart';
import 'package:Bismuth/rocks%20info/GRANITE.dart';
import 'package:Bismuth/rocks%20info/ClassificationOf_U.dart';
import './Upcoming_G.dart';
import 'clases/Task.dart';
import 'coordinates/locHelper.dart';

class editableRec extends StatefulWidget {
  final Task tass;
  editableRec(this.tass);
  @override
  _editableRecState createState() => _editableRecState(tass);
}

Future navigateToClassificaton(context, String imgg) async {
  if (imgg == 'baslat') {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ClassificationOf_U()));
  }
  if (imgg == 'calcite') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CALCITE()));
  }
  if (imgg == 'dacite') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DACITE()));
  }
  if (imgg == 'granite') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GRANITE()));
  } else {}

  // Navigator.push(context, MaterialPageRoute(builder: (context) => load()));
}

class _editableRecState extends State<editableRec> {
  final Task tass;
  _editableRecState(this.tass);

  Widget build(BuildContext context) {
    String _previewImagUrl = LocHelper.generateLoc(
        latitude: tass.record.latitude, longitude: tass.record.longitude);
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          title: Text(
            'DATA RECORD',
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Completed_G()));
                }),
          ],
        ),
        body: Column(
          //to take all the width
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'General Site Data:',
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
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 150,
                            height: 30,
                            child: Text(
                              'City',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Container(
                            width: 120,
                            height: 30,
                            child: Text(
                              'Date',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: 60,
                            child: Text(tass.record.city),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Container(
                            width: 130,
                            height: 60,
                            child: Text(tass.record.date),
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 150,
                            height: 30,
                            child: Text(
                              'Site',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            child: Text(
                              'Stream',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: 60,
                            child: Text(tass.record.siteName),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Container(
                            width: 110,
                            height: 60,
                            child: Text(tass.record.stream),
                          ),
                        ],
                      ),

                      const Divider(
                        height: 20,
                        thickness: 1.2,
                        indent: 10,
                        endIndent: 20,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Cordination:',
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
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 150,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: _previewImagUrl == null
                            ? Text(
                                'No Location Chosen yet ',
                                textAlign: TextAlign.center,
                              )
                            : Image.network(
                                _previewImagUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 150,
                            height: 30,
                            child: Text(
                              'Longtitude',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            child: Text(
                              'Latitude',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: 140,
                            child: Expanded(
                              child: Text(tass.record.longitude.toString()),
                            ),
                          ),
                          SizedBox(
                            width: 68,
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            child: Expanded(
                              child: Text(tass.record.latitude.toString()),
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                        height: 20,
                        thickness: 1.2,
                        indent: 10,
                        endIndent: 20,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      ///line here
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'FIELD ANALYSIS:',
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                            height: 10,
                          ),
                          Container(
                            width: 150,
                            height: 30,
                            child: Text(
                              'EC',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                          // _editTitleTextField(_record[0].ec, _ecCon, 'EC'),

                          SizedBox(
                            width: 60,
                          ),
                          //  Expanded(
                          Container(
                            width: 130,
                            height: 30,
                            child: Text(
                              'EH',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                          // _editTitleTextField(_record[0].eh, _ehCon, 'eh'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: 140,
                            child: Text(tass.record.EC.toString()),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                            width: 130,
                            height: 50,
                            child: Text(tass.record.EH.toString()),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 150,
                            height: 30,
                            child: Text(
                              'Temp',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                          //  _editTitleTextField(_record[0].temp, _tempCon, 'Temp'),
                          SizedBox(
                            width: 60,
                          ),
                          Container(
                            width: 130,
                            height: 30,
                            child: Text(
                              'Ph',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 14,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: 140,
                            child: Text(tass.record.temp.toString()),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                            width: 130,
                            height: 50,
                            child: Text(tass.record.pH.toString()),
                          ),
                        ],
                      ),

                      const Divider(
                        height: 20,
                        thickness: 1.2,
                        indent: 10,
                        endIndent: 20,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'REMARKS:',
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
                      Container(
                        height: 17,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: 140,
                            child: Expanded(
                              child: Text(tass.record.remark),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1.2,
                        indent: 10,
                        endIndent: 20,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'IMAGES:',
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
                      Container(
                        height: 20,
                      ),
                      Card(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical: 2.0,
                          ),
                          height: 100,
                          child: tass.record.images.length == 0
                              ? Text(
                                  'There\'s no Images yet!',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    letterSpacing: -0.38588235473632815,
                                    fontWeight: FontWeight.w500,
                                    height: 1.375,
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tass.record.images.length,
                                  itemBuilder: (ctx, i) {
                                    return Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: ListTile(
                                        leading: Container(
                                          width: 90.5,
                                          height: 150.1,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: MemoryImage(
                                                  tass.record.images[i].image),
                                              fit: BoxFit.cover,
                                            ),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 0.9,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                        onTap: () {
                                          navigateToClassificaton(context,
                                              tass.record.images[i].ImageType);
                                        },
                                      ),
                                    );
                                  }),
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
