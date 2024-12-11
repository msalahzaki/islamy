import 'package:flutter/material.dart';
import 'package:islamy/intro_screen.dart';

import 'core/utils/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.draktheme,
      theme: ThemeData.dark(),
      home: const IntroScreen(),
    );
  }
}
