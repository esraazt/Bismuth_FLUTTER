import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
//the as name just to be clear each used function is coming from whi pack
//this pack to find path
import 'package:path_provider/path_provider.dart' as syspaths;
//this to construct and combine pos
import 'package:path/path.dart' as path;
import 'package:Bismuth/rocks%20info/CALCITE.dart';
import 'package:Bismuth/rocks%20info/ClassificationOf_U.dart';
import 'package:Bismuth/rocks%20info/DACITE.dart';
import 'package:Bismuth/rocks%20info/GRANITE.dart';

import 'dart:io';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:Bismuth/addRec.dart';
import './globalV.dart' as globals;
import 'package:image_picker/image_picker.dart';
import 'Upcoming_G.dart';
import 'clases/Imagee.dart';
import 'clases/record copy.dart';
import 'coordinates/map.dart';

class RecordDe extends StatefulWidget {
  static const routeName = '/add-record';
  @override
  _RecordDeState createState() => _RecordDeState();
}

LatLng selectedLocation;

List<Imagee> imageList = new List<Imagee>();

class _RecordDeState extends State<RecordDe> {
  Future navigateToClassificaton(context, Imagee imgg) async {
    await imgg.getRockType();
    print(imgg.ImageType);

    //imageList.add(imgg);
    if (imgg.ImageType == 'baslat') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ClassificationOf_U()));
    }
    if (imgg.ImageType == 'calcite') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CALCITE()));
    }
    if (imgg.ImageType == 'dacite') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DACITE()));
    }
    if (imgg.ImageType == 'granite') {
      // imageList.add(imgg);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GRANITE()));
    }
    if (imgg.ImageType == 'unidentified') {
      showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog1());
    }
    setState(() {
      imageList.add(imgg);
    });
  }

  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Upcoming_G()));
    imageList = [];
  }

  Future navigateToIMage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => addRec()));
  }

  Future<void> _selectOnMap() async {
    //herreee location varr
    selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => map(
          isSelecting: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }

    print(selectedLocation.latitude);
    print(selectedLocation.longitude);
  }

  Future<void> _addNewRec(
      String recCity,
      String recSite,
      String recStream,
      DateTime recDate,
      double recPh,
      double recEc,
      double recEh,
      double recTemp,
      String recRemarks,
      double longtitude,
      double latitude,
      List<Imagee> imageList) async {
    //check if error
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    Record record = new Record(
        EC: recEc,
        city: recCity,
        siteName: recSite,
        stream: recStream,
        date: formatter.format(recDate).toString(),
        pH: recPh,
        EH: recEh,
        temp: recTemp,
        remark: recRemarks,
        latitude: latitude,
        longitude: longtitude);

    globals.Field.currentTask.record = record;
    globals.Field.currentTask.record.images = imageList;
    await globals.Field.addRecord();

    //########################################################################//
    setState(() {
      imageList = [];
      globals.Field.currentTask = null;
    });
  }

  File _pickedImage;
  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
    print(' _pickedImage $_pickedImage');
  }

  Widget _buildPopupDialog1() {
    return new AlertDialog(
      title: const Text('This Image is Undefined'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 90.5,
            height: 90.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(_storedImage),
                //   const AssetImage(  'assets/images/baslay header.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.black,
                width: 0.9,
              ),

              // borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog(File _storedImage) {
    return new AlertDialog(
      title: const Text('Do you want to classify this image '),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 90.5,
            height: 90.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(_storedImage),
                //   const AssetImage(  'assets/images/baslay header.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.black,
                width: 0.9,
              ),
              // borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            setState(() {
              Imagee img = Imagee(
                  RealImage: _storedImage,
                  StringImage: base64Encode(_storedImage.readAsBytesSync()));
              navigateToClassificaton(context, img);
              _storedImage = null;
            });
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('CLASSIFY'),
        ),
        new FlatButton(
          onPressed: () async {
            setState(() {
              // Imagee indd = await new Imagee();

              imageList.add(Imagee(
                  RealImage: _storedImage,
                  StringImage: base64Encode(_storedImage.readAsBytesSync()),
                  ImageType: 'None'));
              _storedImage = null;
            });

            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('JUST SAVE IT'),
        ),
      ],
    );
  }

  File _storedImage;

  Future<void> _upload() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      //popup

      _storedImage = imageFile;
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(_storedImage),
      );
      print('__storedImage: $_storedImage');
    });

    //to find our app dirctore to store the data currntly
    final dir = await syspaths.getApplicationDocumentsDirectory();
    //imageFile.path leads us to where our imge store (temp)
    final nameP = path.basename(imageFile.path);
    //copy the file into the spcific path
    final savedImage = await imageFile.copy('${dir.path}/$nameP ');
    // _pickedImage = savedImage;
    selectImage(savedImage);
  }

  final city = TextEditingController();

  final site = TextEditingController();

  final stream = TextEditingController();

  final temp = TextEditingController();

  final ec = TextEditingController();

  final eh = TextEditingController();

  final ph = TextEditingController();

  final rema = TextEditingController();

  DateTime _selectedDate;

  Future<void> _saveRecord() async {
    if (city.text.isEmpty) {
      return;
    }
    await _addNewRec(
        city.text.toString(),
        site.text.toString(),
        stream.text.toString(),
        _selectedDate,
        double.parse(temp.text.toString()),
        double.parse(ec.text.toString()),
        double.parse(eh.text.toString()),
        double.parse(ph.text.toString()),
        rema.text.toString(),
        selectedLocation.longitude,
        selectedLocation.latitude,
        imageList);

    print('entred');
    setState(() {
      imageList = [];
      globals.Field.currentTask == null;
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Upcoming_G()));
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        print(_selectedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
            //alignment: AlignmentDirectional.bottomEnd,
            color: Colors.indigo,
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
              imageList = [];
              navigateToSubPage(context);
            }),
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
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'City'),
                            controller: city,
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),

                        //  Expanded(
                        Container(
                          width: 150,
                          height: 40,
                          child: RaisedButton.icon(
                            color: Colors.lightBlue[900],
                            onPressed: _presentDatePicker,
                            icon: Icon(
                              Icons.date_range_outlined,
                              color: Colors.white70,
                            ),
                            label: Text(
                              'Choose Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Site:'),
                            controller: site,
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Stream:'),
                            controller: stream,
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                      ],
                    ),
                    RaisedButton.icon(
                      color: Colors.lightBlue[900],
                      onPressed: _selectOnMap,
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white70,
                      ),
                      label: Text(
                        'Cordinates',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    Container(
                      height: 5.0,
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
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          child: TextField(
                            decoration:
                                InputDecoration(labelText: 'EC(uS/cm):'),
                            controller: ec,
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'EH:'),
                            controller: eh,
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Temp:'),
                            controller: temp,
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          child: TextField(
                            decoration: InputDecoration(labelText: 'pH:'),
                            controller: ph,
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 14,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 5.0,
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
                        'REMARKS:',
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
                      width: 360,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Enter your Remarks here'),
                        controller: rema,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                      ),
                    ),
                    Container(
                      height: 5.0,
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
                        'IMAGES:',
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
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      //   child: Expanded(
                      child: Text(
                        'Classify rock information easily by inserting it’s \nimage.or just save any needed images',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Colors.grey[600],
                          letterSpacing: -0.16,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      // ),
                    ),
                    buildImage(context),
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
                        width: double.infinity,
                        child: imageList.length == 0
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
                                itemCount: imageList.length,
                                itemBuilder: (ctx, i) {
                                  return Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: ListTile(
                                      leading: Container(
                                        alignment: Alignment.center,
                                        width: 90.5,
                                        height: 150.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                                imageList[i].RealImage),
                                            //   const AssetImage(  'assets/images/baslay header.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey[800],
                                            width: 0.9,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                      ),
                                      onTap: () {
                                        navigateToClassificaton(
                                            context,
                                            globals.Field.currentTask.record
                                                .images[i]);
                                      },
                                    ),
                                  );
                                }),
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    Container(
                      width: 20,
                    ),
                    RaisedButton.icon(
                      icon: Icon(Icons.save),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      textColor: Colors.white,
                      label: Text(
                        'Submit Record',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          letterSpacing: -0.5305882377624512,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      onPressed: _saveRecord,

                      elevation: 3,
                      //to get rid of the extra margin
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      color: Colors.lightBlue[900],
                    ),
                    Container(
                      width: 30,
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

  Widget buildImage(BuildContext context) => FocusedMenuHolder(
        menuWidth: MediaQuery.of(context).size.width - 50,
        menuItems: [
          FocusedMenuItem(
            title: Text('Upload image '),
            trailingIcon: Icon(Icons.photo_library_rounded),
            onPressed: _upload,
          ),
          FocusedMenuItem(
            title: Text('Open Camera'),
            trailingIcon: Icon(Icons.camera_enhance),
            onPressed: () => navigateToIMage(context),
          ),
        ],
        blurBackgroundColor: Colors.blueGrey[900],
        menuOffset: -20,
        openWithTap: true,
        duration: Duration(seconds: 0),
        animateMenuItems: true,
        onPressed: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
              aspectRatio: 20 / 3,
              child: FlatButton.icon(
                icon: Icon(
                  Icons.panorama_outlined,
                  color: Colors.lightBlue[900],
                ),
                label: Text(
                  'Insert Image',
                  style: TextStyle(
                    color: Colors.lightBlue[900],
                  ),
                ),
              )),
        ),
      );
}
