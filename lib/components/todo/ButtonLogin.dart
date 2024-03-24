import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 0))
            ]),
        child: GestureDetector(
          onTap: () => onTap(),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontFamily: 'poppinsbold'),
          ),
        ));
  }
}
