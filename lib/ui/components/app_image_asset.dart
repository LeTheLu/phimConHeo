import 'package:flutter/material.dart';

class AppImageAsset extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? weight;
  final Color? color;
  const AppImageAsset({Key? key,required this.imagePath,this.height = 30,this.weight = 30,this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: height,
      width: weight,
      color: color,
    );
  }
}
