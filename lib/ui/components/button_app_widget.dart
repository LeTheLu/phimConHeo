import 'package:flutter/material.dart';

class ButtonAppWidget extends StatelessWidget {
  final String image, buttonName;

  const ButtonAppWidget(
      {Key? key, required this.image, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 130) / 4,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0x33FFFFFF),
        ),
        gradient: const LinearGradient(colors: [
          Color(0x4DA6A1E0),
          Color(0x4DA1F3FE),
          Color(0x33FFFFFF),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(
              image,
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 3,
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
                fontFamily: 'BeVietNamPro',
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
