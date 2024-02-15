import 'package:flutter/material.dart';

class ButtonAddToDel extends StatelessWidget {
  final Color? color;
  const ButtonAddToDel({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      // Quantity
      Row(
        children: [
          // Min
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(224, 224, 224, 0.187),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () => null,
                icon: const Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                )),
          ),
          // Count
          Text(
            1.toString(),
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          // Max
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(224, 224, 224, 0.187),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () => null,
                icon: const Icon(
                  Icons.remove,
                  size: 25,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    ]);
  }
}
