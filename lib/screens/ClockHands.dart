import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hrms/clock/Hours.dart';
import 'package:hrms/clock/Seconds.dart';

import '../Minutes.dart';

class ClockHands extends StatefulWidget {
  @override
  _ClockHandsState createState() => _ClockHandsState();
}

class _ClockHandsState extends State<ClockHands> {
  late Timer _timer;
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    _timer = new Timer.periodic(Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: CustomPaint(
            size: Size(250, 250),
            painter: Seconds(
              seconds: dateTime.second,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(250, 250),
            painter: Minutes(
              minutes: dateTime.minute,
              seconds: dateTime.second,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(250, 250),
            painter: Hours(
              hours: dateTime.hour,
              minutes: dateTime.minute,
            ),
          ),
        )
      ],
    );
  }
}