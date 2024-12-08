import 'package:flutter/material.dart';

import 'core/utils/app_theme.dart';
import 'home/home.dart';

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
      home: const Home(),
    );
  }
}
