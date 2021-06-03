import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
//the as name just to be clear each used function is coming from whi pack
//this pack to find path
import 'package:path_provider/path_provider.dart' as syspaths;
//this to construct and combine pos
import 'package:path/path.dart' as path;

class imageIn extends StatefulWidget {
  final Function onSelectImage;
  imageIn(this.onSelectImage);

  @override
  _imageInState createState() => _imageInState();
}

class _imageInState extends State<imageIn> {
  File _storedImage;

  Future<void> _takePicture() async {
    // final picker =ImagePicker();

    ////hereee image varr
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = imageFile;
    });
    //to find our app dirctore to store the data currntly
    final dir = await syspaths.getApplicationDocumentsDirectory();
    //imageFile.path leads us to where our imge store (temp)
    final nameP = path.basename(imageFile.path);
    //copy the file into the spcific path
    final savedImage = await imageFile.copy('${dir.path}/$nameP ');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          //the photo container
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image yet',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(
              Icons.camera_enhance,
              color: Colors.lightBlue[900],
            ),
            label: Text('Take Image'),
            textColor: Colors.lightBlue[900],
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
