import 'package:app/pages/SecondPage.dart';
import 'package:app/providers/ThemeChanger.dart';
import 'package:app/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(
      context,
    );
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ThemeMode.light == themeChanger.getTheme
              ? const Text('Claro')
              : const Text('Obscuro'),
          Text(myProvider.myText),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    myProvider.setMytext = 'Texto 2';
                  },
                  child: const Text("First Button")),
              TextButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondPage()))
                      },
                  child: const Text("Second Button")),
            ],
          ),
          RadioListTile(
              title: const Text('Modo obscuro'),
              value: ThemeMode.dark,
              groupValue: themeChanger.getTheme,
              onChanged: themeChanger.setTheme),
          RadioListTile(
              title: const Text('Modo claro'),
              value: ThemeMode.light,
              groupValue: themeChanger.getTheme,
              onChanged: themeChanger.setTheme),
          RadioListTile(
              title: const Text('Color del sistema'),
              value: ThemeMode.system,
              groupValue: themeChanger.getTheme,
              onChanged: themeChanger.setTheme),
        ],
      ),
    );
  }
}
