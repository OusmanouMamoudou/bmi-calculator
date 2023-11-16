import 'package:bmi/const.dart';
import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key, required this.text, this.function});
  final String text;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: kBottomBarColor,
        height: kBottomBarHeight,
        child: Center(
          child: Text(
            text,
            style: kbottomBarStyle,
          ),
        ),
      ),
    );
  }
}
