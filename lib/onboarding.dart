import 'package:flutter/material.dart';
import 'package:medoraa_1/login.dart';
import 'package:medoraa_1/sign.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F3), // لون الخلفية
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ اللوجو مع كلمة "Medora"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/stethoscope.png', // تأكد من وضع الصورة في المسار الصحيح
                  width: 20,
                ),
                const SizedBox(width: 0), // مسافة بين اللوجو والنص
                const Text(
                  "Medora",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6FC0D3), // نفس لون الأزرار
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100), // زيادة المسافة قبل العنوان

            // ✅ عنوان الترحيب
            const Text(
              "Welcome to Medora\nyour health store!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 100), // زيادة المسافة قبل الأزرار

            // ✅ زر Sign Up
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6FC0D3), // لون الزر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20), // زيادة المسافة قبل الزر التالي

            // ✅ زر Login
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 30), // زيادة المسافة قبل زر الاستكشاف

            // ✅ زر Explore
            TextButton(
              onPressed: () {},
              child: const Text(
                "Explore",
                style: TextStyle(
                  color: Color(0xFF6FC0D3),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
