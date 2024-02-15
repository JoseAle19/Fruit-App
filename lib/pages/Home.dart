import 'package:app/pages/FirtsPage.dart';
import 'package:app/pages/Fruits/Login.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextButton(
        child: const Text('Ir al primer ejemplo'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const FirstPage()));
        },
      ),
      TextButton(
        child: const Text('Ir al segundo ejemplo'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginFruit()));
        },
      )
    ]);
  }
}
