import 'package:app/components/MyButton.dart';
import 'package:app/pages/Fruits/MenuPageSushi.dart';
import 'package:app/themes/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondProviderExample extends StatelessWidget {
  const SecondProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Name
            Text(
              'Fruits App',
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 32, color: Colors.white),
            ),
            // Icon
            const SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/img1.png',
                  height: 200,
                ),
              ),
            ),
            // Title
            const SizedBox(
              height: 25,
            ),
            Text(
              'El sabor  de cada fruta',
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
            ),
            // Subtitle
            const SizedBox(
              height: 10,
            ),
            Text(
              'Siente el sabor de cada fruta de nustro huerto mas popular  desde cualquier  lugar  y en cualquier momento',
              style: TextStyle(
                color: Colors.grey[200],
                height: 2,
              ),
            ),
            // Get started Button
            const SizedBox(
              height: 20,
            ),

            MyButton(
              text: 'Iniciar',
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MenuPage()))
              },
            )
          ],
        ),
      ),
    );
  }
}
