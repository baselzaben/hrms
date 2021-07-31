import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ClockDialog.dart';
import 'ClockFace.dart';
import 'ClockHands.dart';
import 'package:location/location.dart';
import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:vector_math/vector_math.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/material.dart' show StatefulWidget, StatelessWidget;
import 'package:flutter/src/material/colors.dart';

class Clock extends StatefulWidget {



  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {

    double earthRadius =6356752.3141;
    late bool _serviceEnabled;
    late PermissionStatus _permissionGranted;
    late LocationData _userLocation;
    double lat=0;
    double long=0;

    getDistance(double latfrom,double longfrom,double latto,double longto){
      var dLat = radians(latfrom -latto);
      var dLng = radians(longfrom - longto);
      var a = sin(dLat/2) * sin(dLat/2) + cos(radians(latto))
          * cos(radians(latfrom)) * sin(dLng/2) * sin(dLng/2);
      var c = 2 * atan2(sqrt(a), sqrt(1-a));
      var d = earthRadius * c;
      print("gdfgfdg "+d.toString()); //d is the distance in meters
    }


    Future<void> _getUserLocation() async {
      Location location = new Location();

      // Check if location service is enable
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      // Check if permission is granted
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      final _locationData = await location.getLocation();
      setState(() {
        lat=_locationData.latitude!;
        long=_locationData.longitude!;
        getDistance(lat,long,32.0151863,35.8666018,);
        _userLocation = _locationData;
      });
    }

    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
     backgroundColor: Colors.grey[850]!,
      body: Stack(
        children: <Widget>[
          Center(
            child: ClockFace(
              height: 320,
              width: 320,
            ),
          ),
          Center(
            child: Container(
              child: CustomPaint(
                size: Size(300, 300),
                painter: ClockDialog(),
              ),
            ),
          ),
          Center(
            child: ClockHands(),
          ),
    ElevatedButton(
    onPressed: _getUserLocation, child: Text('Check Location')),
    SizedBox(height: 25),
   /* lat != null
    ? Padding(
    padding: const EdgeInsets.all(8.0));*/
        ],


      ),
    );
  }
}