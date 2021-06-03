import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Bismuth/coordinates/map.dart';
import '../clases/record copy.dart';

class locIn extends StatefulWidget {
  @override
  _locInState createState() => _locInState();
}

class _locInState extends State<locIn> {
  String _previewImagUrl;
  List<Record> _items = [];
  List<Record> get items {
    return [..._items];
  }

/*
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocHelper.generateLoc(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    setState(() {
      _previewImagUrl = staticMapImageUrl;
    });
  }
*/
  Future<void> _selectOnMap() async {
    //herreee location varr
    final LatLng selectedLocation = await Navigator.of(context).push(
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
    final newLoc = Record(
      EC: null,
      EH: null,
      city: null,
      date: null,
      pH: null,
      remark: null,
      siteName: null,
      stream: null,
      temp: null,
      latitude: selectedLocation.latitude,
      //  images: null,
      longitude: selectedLocation.longitude,

      // title: pickedTitle,

      //location: null,
    );
    _items.add(newLoc);

    print(selectedLocation.latitude);
    print(selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /* Container(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.location_on,
              ),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUserLocation,
            ),*/
        FlatButton.icon(
          icon: Icon(
            Icons.map,
          ),
          label: Text('Cordinates'),
          textColor: Theme.of(context).primaryColor,
          onPressed: _selectOnMap,
        ),
      ],
    );
  }
}
