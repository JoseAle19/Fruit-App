import 'package:app/pages/Todo/Home.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  void navigatePage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeTodo())),
    );
  }

  @override
  void initState() {
    navigatePage();
    super.initState();
  }

// TODO:Agregar estado de carga del delay
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/onboarding.png')),
    );
  }
}
