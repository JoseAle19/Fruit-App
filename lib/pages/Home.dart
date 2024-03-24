import 'package:app/pages/FirtsPage.dart';
import 'package:app/pages/Fruits/Login.dart';
import 'package:app/pages/Todo/Home.dart';
import 'package:app/pages/Todo/Welcome.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          ListTile(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const FirstPage())),
            title: const Text("Ejemplo Provider temas"),
            leading: const Icon(Icons.text_snippet_sharp),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const LoginFruit())),
            title: const Text("App Frutas"),
            leading: const Icon(Icons.shopping_bag),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () => Navigator.push(
                // context, MaterialPageRoute(builder: (_) => const Welcome())),
                context,
                MaterialPageRoute(builder: (_) => const HomeTodo())),
            title: const Text("App Tareas"),
            leading: const Icon(Icons.task),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ]),
      ),
    );
  }
}
