import 'package:app/pages/Todo/CardCalendar.dart';
import 'package:flutter/material.dart';

class HeadTask extends StatelessWidget {
  const HeadTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height / 5,
      width: double.infinity,
      color: const Color.fromRGBO(243, 196, 251, 1),
      child: Column(
        children: [
          const Text(
            'Today',
            style: TextStyle(fontFamily: 'poppinsmedium', fontSize: 25),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return CardCalendar(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
