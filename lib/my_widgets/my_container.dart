import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  const MyContainer({
    super.key,
    required this.color,
    this.containerChild,
    this.function,
  });
  final Color color;
  final Widget? containerChild;
  final void Function()? function;

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: widget.color,
        ),
        child: widget.containerChild,
      ),
    );
  }
}
