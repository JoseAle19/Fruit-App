import 'package:app/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(myProvider.myText),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(myProvider.myText),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Volver"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
