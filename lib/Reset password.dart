import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isPasswordValid = false;
  bool isPasswordMatched = false;

  void validatePassword(String password) {
    final bool hasMinLength = password.length >= 8;
    final bool hasNumber = password.contains(RegExp(r'[0-9]'));
    final bool hasLower = password.contains(RegExp(r'[a-z]'));
    final bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    final bool hasSpecial =
        password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    setState(() {
      isPasswordValid = hasMinLength &&
          ((hasNumber ? 1 : 0) +
                  (hasLower ? 1 : 0) +
                  (hasUpper ? 1 : 0) +
                  (hasSpecial ? 1 : 0)) >=
              3;
      isPasswordMatched = _confirmPasswordController.text == password;
    });
  }

  void validateConfirmPassword(String confirmPassword) {
    setState(() {
      isPasswordMatched = _passwordController.text == confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'To keep your account secure, your new password must be at least 8 characters long and contain a minimum of 3 of the following: 1 number, 1 lowercase letter, 1 uppercase letter, or 1 special character.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Create new password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                suffixIcon: isPasswordValid
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : null,
              ),
              onChanged: validatePassword,
            ),
            const SizedBox(height: 10),
            if (_passwordController.text.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(isPasswordValid ? Icons.check : Icons.close,
                        color: isPasswordValid ? Colors.green : Colors.red),
                    const SizedBox(width: 8),
                    Text(isPasswordValid ? 'Valid!' : 'Invalid Password')
                  ],
                ),
              ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                suffixIcon: isPasswordMatched
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : null,
              ),
              onChanged: validateConfirmPassword,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isPasswordValid && isPasswordMatched ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6FC0D3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'conform Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
