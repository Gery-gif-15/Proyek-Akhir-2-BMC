import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const BMCApp());
}

class BMCApp extends StatelessWidget {
  const BMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMC App",
      home: const SplashScreen(),
    );
  }
}