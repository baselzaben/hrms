import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  final double width;
  final double height;

  ClockFace({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[850],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[900]!,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey[800]!,
              offset: Offset(-5.0, -5.0),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ]),
      child: Center(

        child: Container(

          width: 5.0,
          height: 5.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}