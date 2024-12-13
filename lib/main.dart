import 'package:flutter/material.dart';
import 'package:islamy/home/home.dart';

import 'core/utils/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}
