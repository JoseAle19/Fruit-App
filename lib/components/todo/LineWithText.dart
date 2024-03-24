import 'package:flutter/material.dart';

class LineWithText extends StatelessWidget {
  const LineWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.black38,
          height: 1,
          width: 100,
        ),
        const Text(
          'Or',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.black38,
          width: 100,
          height: 1,
        ),
      ],
    );
  }
}
