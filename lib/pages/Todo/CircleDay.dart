import 'package:flutter/material.dart';

class CircleDay extends StatelessWidget {
  const CircleDay({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final dayNUmber = index + 1;
    return Container(
      height: 40,
      width: 40,
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Center(
          child: Text(
        dayNUmber.toString(),
        style: TextStyle(
            fontFamily: index == 1 ? 'poppinsbold' : 'poppinsmedium',
            fontSize: 20),
      )),
    );
  }
}
