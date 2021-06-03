import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Bismuth/RecordDe.dart';
import 'rocks info/GreatRecord.dart';
import 'dart:io';
import 'imageIn.dart';

class addRec extends StatefulWidget {
  static const routeName = '/add-record';
  @override
  _addRecState createState() => _addRecState();
}

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => RecordDe()));
}

class _addRecState extends State<addRec> {
  final _titleController = TextEditingController();

  File _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

//submit
  void _saveRecord() {
    //so we can't hit the add without having somthing to add!!
    if (_titleController.text.isEmpty || _pickedImage == null) {
      //show dialog to error msg
      return;
    }
    Provider.of<GreatRecord>(context, listen: false).addPlace(_pickedImage);
    //to leave this page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RecordDe()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a New image',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            color: const Color(0xff3a4f69),
            letterSpacing: -0.5305882377624512,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        leading: IconButton(
            alignment: AlignmentDirectional.centerStart,
            color: Colors.indigo,
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
              navigateToSubPage(context);
            }),
      ),
      body: Column(
        //to take all the width
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    //get some info once the image is taking
                    imageIn(_selectImage),
                    Container(
                      height: 50,
                    ),
                    RaisedButton.icon(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      label: Text(
                        'classify this image',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: const Color(0xffffffff),
                          letterSpacing: -0.5305882377624512,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      onPressed: _saveRecord,
                      //to drop the shadow

                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      color: Colors.lightBlue[900],
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
