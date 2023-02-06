import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;

  const AppCircularProgressIndicator(
      {Key? key, this.color = Colors.white, this.backgroundColor = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: color,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
