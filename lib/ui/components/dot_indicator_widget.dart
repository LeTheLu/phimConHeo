import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicatorWidget extends StatelessWidget {
  final int dotsCount;
  final double position;
  final double size;
  final double spacing;

  const DotIndicatorWidget(
      {Key? key,
      required this.dotsCount,
      required this.position,
      required this.size,
      required this.spacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        size: Size.square(size),
        spacing: EdgeInsets.all(spacing),
      ),
    );
  }
}
