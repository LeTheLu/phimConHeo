import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final double? height;

  const BottomBarWidget({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF2B5876),
          Color(0xFF4E4376),
        ], begin: Alignment.centerRight, end: Alignment.centerLeft),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/ic_home.png',
              height: 30,
              width: 30,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/ic_favorite.png',
              height: 30,
              width: 30,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/ic_ticket.png',
              height: 30,
              width: 30,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/ic_account.png',
              height: 30,
              width: 30,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/ic_shuffle.png',
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
