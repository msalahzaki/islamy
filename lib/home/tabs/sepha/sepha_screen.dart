import 'package:flutter/material.dart';

class SephaScreen extends StatelessWidget {
  const SephaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/SebhaBG.png'), // Your image file
              fit: BoxFit.cover),
        ));
  }
}
