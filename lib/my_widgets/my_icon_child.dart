import 'package:bmi/const.dart';
import 'package:flutter/material.dart';

class MyIconChild extends StatelessWidget {
  const MyIconChild({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
