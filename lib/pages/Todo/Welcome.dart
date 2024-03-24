import 'dart:ui';

import 'package:app/components/todo/ButtonLogin.dart';
import 'package:app/components/todo/SocialNetworks.dart';
import 'package:app/components/todo/lineWithText.dart';
import 'package:app/pages/Todo/Login.dart';
import 'package:app/themes/Colors.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackGround(),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: const SizedBox(
                width: double.infinity,
                height: double.infinity,
                // color: Colors.red,
                child: InfoScreen(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 40),
              width: 250,
              // color: Colors.green,
              child: const Text(
                'Do your tasks quickly and easy',
                style: TextStyle(
                    height: 1.8, fontSize: 50, fontWeight: FontWeight.w400),
                maxLines: 4,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Your tasks, your rules, our support.',
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
        // Boton de login y de recuoerar pass
        const NewAccountOptions(),
        const SocialNetworks()
      ],
    );
  }
}

class NewAccountOptions extends StatelessWidget {
  const NewAccountOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Button(
              title: 'Login',
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LoginTodo())),
            ),
          ),
          const TextButton(
            onPressed: null,
            child: Text(
              'Create an account',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: LineWithText(),
          )
        ],
      ),
    );
  }
}

class CustomGradientContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final double height;
  final double width;

  const CustomGradientContainer({
    super.key,
    required this.color1,
    required this.color2,
    this.height = 250,
    this.width = 250,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [color1, color2],
        ),
      ),
      height: height,
      width: width,
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(children: [
        Positioned(
            left: MediaQuery.of(context).size.width / 2 - 90,
            top: 0,
            child: CustomGradientContainer(
              color1: circleColor1,
              color2: Colors.white,
              height: 200,
              width: 200,
            )),
        Positioned(
            bottom: 0,
            right: -140,
            child: CustomGradientContainer(
              color1: taskFColor,
              color2: taskFColorSecond,
              height: 350,
              width: 350,
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 2 - 250,
            left: -300,
            child: CustomGradientContainer(
              color1: circleColor3,
              color2: taskFColorSecond.withOpacity(.2),
              height: 500,
              width: 500,
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 8.0,
                sigmaY: 8.0), // Ajusta el desenfoque según tu preferencia
            child: Container(
              color: Colors
                  .transparent, // Puedes ajustar el color de fondo si es necesario
            ),
          ),
        ),
      ]),
    );
  }
}
