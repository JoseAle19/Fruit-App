import 'package:app/themes/Colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onTap;
  const MyButton(
      {super.key, required this.text, required this.onTap, this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color ?? secondColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(
              width: 15,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
