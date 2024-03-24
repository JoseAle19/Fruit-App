import 'package:flutter/material.dart';

class SocialNetworks extends StatelessWidget {
  const SocialNetworks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/networks/facebook.png',
          height: 50,
          width: 50,
        ),
        Image.asset(
          'assets/networks/google.png',
          height: 50,
          width: 50,
        )
      ],
    );
  }
}
