import 'package:flutter/material.dart';
import 'package:medoraa_1/SplashScreen.dart';
import 'package:medoraa_1/home.dart';
import 'package:medoraa_1/login.dart';
import 'package:medoraa_1/sign.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
