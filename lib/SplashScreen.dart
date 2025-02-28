import 'package:flutter/material.dart';
import 'dart:async';

import 'package:medoraa_1/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _circleSize = 50.0;
  double _opacity = 0.0;
  bool _backgroundFilled = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _circleSize = 200.0;
        _opacity = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _backgroundFilled = true;
      });
    });

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _backgroundFilled ? const Color(0xFF6FC0D3) : Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: _circleSize,
              height: _circleSize,
              decoration: BoxDecoration(
                color: const Color(0xFF6FC0D3).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _opacity,
              child: const Text(
                "MEDORA",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية المخصصة
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/Ellipse 1.png',
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // المحتوى الرئيسي
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MEDORA",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6FC0D3),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Medical product",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/image 225.png',
                  width: 245.39,
                ),
                const SizedBox(height: 30),
                const Text(
                  "medical product",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6FC0D3),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // الانتقال إلى OnboardingScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6FC0D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 140, vertical: 15),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
