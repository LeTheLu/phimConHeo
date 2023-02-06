import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;

  TextWidget({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'BeVietNamPro',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}
