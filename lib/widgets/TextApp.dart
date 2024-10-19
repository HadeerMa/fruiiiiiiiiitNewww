import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  TextApp(
      {super.key,
      required this.text,
      required this.color1,
      required this.size,
      required this.weight,
      this.decoration,
      this.color2,
      this.thikness});
  String text;
  Color color1;
  double size;
  FontWeight weight;
  TextDecoration? decoration;
  Color? color2;
  double? thikness;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color1,
          fontSize: size,
          fontWeight: weight,
          decoration: decoration,
          decorationColor: color2,
          decorationThickness: thikness),
    );
  }
}
