import 'package:app/pages/Todo/CircleDay.dart';
import 'package:flutter/material.dart';

class CardCalendar extends StatelessWidget {
  const CardCalendar({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index == 1
              ? const Color.fromRGBO(186, 104, 200, 1)
              : const Color.fromRGBO(222, 181, 228, 1),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Sun',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: index == 1 ? 'poppinsbold' : 'poppinsmedium'),
            ),
            CircleDay(index: index)
          ],
        ));
  }
}
