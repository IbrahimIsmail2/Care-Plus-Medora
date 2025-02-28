import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraa_1/SplashScreen.dart';
import 'package:medoraa_1/login.dart';
import 'package:medoraa_1/onboarding.dart';
import 'package:medoraa_1/sign.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // هنا يتم تشغيل شاشة التسجيل
    );
  }
}
