import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../clases/record copy.dart';

class map extends StatefulWidget {
  final RecLocation initialLocation;
  final bool isSelecting;

  map({
    this.initialLocation =
        const RecLocation(latitude: 21.4858, longitude: 39.1925),
    this.isSelecting = false,
  });

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  LatLng _chosenL;
  void _sele(LatLng pos) {
    setState(() {
      _chosenL = pos;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          title: Text(
            'Coordinates',
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
            if (widget.isSelecting)
              IconButton(
                  icon: Icon(Icons.check),
                  color: Colors.lightBlue[900],
                  onPressed: () {
                    Navigator.of(context).pop(_chosenL);
                  }),
          ]),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 14,
        ),
        onTap: widget.isSelecting ? _sele : null,
        markers: _chosenL == null
            ? null
            : {
                Marker(markerId: MarkerId('h4'), position: _chosenL),
              },
      ),
    );
  }
}
