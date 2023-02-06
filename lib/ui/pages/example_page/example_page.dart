import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  final String text;

  const ExamplePage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
