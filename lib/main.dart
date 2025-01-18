import 'package:flutter/material.dart';
// import 'package:lg_task2/screens/home/home_screen.dart';
import 'package:lg_task2/screens/landing/landing_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LG Task 2',
      debugShowCheckedModeBanner: false,
      home:const LandingScreen(),
    );
  }
}
