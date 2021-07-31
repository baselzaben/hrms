/*
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:vector_math/vector_math.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //double earthRadius = 6371000;
  double earthRadius =6356752.3141;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _userLocation;
  double lat=0;
  double long=0;
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


  getDistance(double latfrom,double longfrom,double latto,double longto){
    var dLat = radians(latfrom -latto);
    var dLng = radians(longfrom - longto);
    var a = sin(dLat/2) * sin(dLat/2) + cos(radians(latto))
        * cos(radians(latfrom)) * sin(dLng/2) * sin(dLng/2);
    var c = 2 * atan2(sqrt(a), sqrt(1-a));
    var d = earthRadius * c;
    print("gdfgfdg "+d.toString()); //d is the distance in meters
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _getUserLocation, child: Text('Check Location')),
            SizedBox(height: 25),
            lat != null
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Your latitude: ${lat}  Your longtude: ${long}'),
                  SizedBox(width: 10),

                ],
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
*/
//}
import 'package:flutter/material.dart';
import 'package:hrms/screens/Clock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      home: Clock(),
    );
  }
}