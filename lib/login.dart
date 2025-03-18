import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraa_1/Forgot%20password.dart';

// Bloc Events
abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}

// Bloc State
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {}

// Bloc Logic
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2)); // Simulate network delay
      if (event.email == "hala50@gmail.com" && event.password == "hal5m7b") {
        emit(LoginInitial());
      } else {
        emit(LoginFailure());
      }
    });
  }
}

// UI
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login to your medical store",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      if (state is LoginFailure)
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.error, color: Colors.white),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Text(
                                  "Email or Password is incorrect. Please try again.",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 16),
                      _buildTextField("Email", emailController, false,
                          state is LoginFailure),
                      const SizedBox(height: 16),
                      _buildTextField("Password", passwordController, true,
                          state is LoginFailure),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen()),
                            );
                          },
                          child: const Text(
                            "Forgot your password?",
                            style: TextStyle(color: Color(0xFF6FC0D3)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6FC0D3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginSubmitted(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Or continue with",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black54)),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(Icons.facebook, Colors.blue),
                          const SizedBox(width: 20),
                          _buildSocialButton(Icons.g_translate, Colors.red),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Not on Medora yet?",
                              style: TextStyle(fontSize: 14)),
                          TextButton(
                            onPressed: () {
                              // انتقل إلى شاشة التسجيل
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6FC0D3),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      bool isPassword, bool hasError) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: hasError ? Colors.red : Colors.grey),
        ),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility, color: Colors.grey)
            : null,
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: Icon(icon, color: color, size: 32),
    );
  }
}
