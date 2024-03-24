import 'package:app/providers/todo/PagesTaskProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.text,
    this.onTap,
    required this.value,
  });
  final VoidCallback? onTap;
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    final pagesTaskProvider = Provider.of<PagesTaskProvider>(context);
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Duración de la animación
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color: pagesTaskProvider.selected == value
                    ? Colors.transparent
                    : Colors.grey.shade200),
            color: pagesTaskProvider.selected == value
                ? const Color.fromRGBO(186, 104, 200, .5)
                : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'poppinsmedium', fontSize: 15),
        ),
      ),
    );
  }
}
