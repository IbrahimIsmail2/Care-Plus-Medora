import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraa_1/Forgot%20password.dart';
import 'package:medoraa_1/Reset%20password.dart';
import 'package:medoraa_1/Setting.dart';
import 'package:medoraa_1/SplashScreen.dart';
import 'package:medoraa_1/home.dart';
import 'package:medoraa_1/login.dart';
import 'package:medoraa_1/onboarding.dart';
import 'package:medoraa_1/plogs.dart';
import 'package:medoraa_1/profile.dart';
import 'package:medoraa_1/search.dart';
import 'package:medoraa_1/sign.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
