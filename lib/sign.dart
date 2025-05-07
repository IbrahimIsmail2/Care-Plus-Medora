// import 'package:flutter/material.dart';

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;

//   String? _emailError;
//   String? _passwordError;
//   String? _nameError;

//   void _validateForm() {
//     setState(() {
//       _emailError = _validateEmail(_emailController.text);
//       _passwordError = _validatePassword(_passwordController.text);
//       _nameError = _validateName(_nameController.text);
//     });

//     if (_formKey.currentState!.validate() &&
//         _emailError == null &&
//         _passwordError == null &&
//         _nameError == null) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Processing Data")));
//     }
//   }

//   String? _validateEmail(String value) {
//     if (value.isEmpty) {
//       return "Please enter your email address";
//     } else if (!RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(value)) {
//       return "Please enter a valid email address, e.g. joe@mail.com";
//     }
//     return null;
//   }

//   String? _validatePassword(String value) {
//     if (value.length < 8) {
//       return "Must be at least 8 characters long";
//     }
//     return null;
//   }

//   String? _validateName(String value) {
//     if (value.isEmpty) {
//       return "Please enter your name";
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: ListView(
//             children: [
//               SizedBox(height: 24),
//               Text(
//                 "Create your account to save time & care more for your health",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//               SizedBox(height: 32),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     _buildTextField("Name", _nameController, false, _nameError),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                         "Email", _emailController, false, _emailError),
//                     SizedBox(height: 16),
//                     _buildTextField(
//                         "Password", _passwordController, true, _passwordError),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: _validateForm,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF6FC0D3),
//                   minimumSize: Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 child: Text(
//                   "Sign up",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Or continue with",
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _buildSocialButton("assets/facebook.png"),
//                   SizedBox(width: 20),
//                   _buildSocialButton("assets/google.png"),
//                 ],
//               ),
//               SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Already a Medora member? ",
//                       style: TextStyle(fontSize: 14)),
//                   GestureDetector(
//                     onTap: () {},
//                     child: const Text(
//                       "Login",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Color(0xFF6FC0D3),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: 24),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: const TextSpan(
//                   text: "By clicking Sign up or Log in, I agree to ",
//                   style: TextStyle(fontSize: 12, color: Colors.black45),
//                   children: [
//                     TextSpan(
//                       text: "Medora’s Terms of Service",
//                       style: TextStyle(color: Color(0xFF6FC0D3)),
//                     ),
//                     TextSpan(
//                       text: " and ",
//                       style: TextStyle(color: Colors.black45),
//                     ),
//                     TextSpan(
//                       text: "Privacy Policy.",
//                       style: TextStyle(color: Color(0xFF6FC0D3)),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, TextEditingController controller,
//       bool isPassword, String? errorText) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextFormField(
//           controller: controller,
//           obscureText: isPassword ? _obscurePassword : false,
//           decoration: InputDecoration(
//             labelText: label,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: errorText != null ? Colors.red : Colors.grey,
//               ),
//             ),
//             suffixIcon: isPassword
//                 ? IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   )
//                 : null,
//           ),
//         ),
//         if (errorText != null) ...[
//           SizedBox(height: 4),
//           Row(
//             children: [
//               Icon(Icons.error, color: Colors.red, size: 18),
//               SizedBox(width: 4),
//               Expanded(
//                 child: Text(
//                   errorText,
//                   style: TextStyle(color: Colors.red, fontSize: 12),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ],
//     );
//   }

//   Widget _buildSocialButton(String assetPath) {
//     return GestureDetector(
//       onTap: () {},
//       child: CircleAvatar(
//         radius: 24,
//         backgroundColor: Colors.white,
//         backgroundImage: AssetImage(assetPath),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:medoraa_1/login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  String? _emailError;
  String? _passwordError;
  String? _nameError;

  void _validateForm() {
    setState(() {
      _emailError = _validateEmail(_emailController.text);
      _passwordError = _validatePassword(_passwordController.text);
      _nameError = _validateName(_nameController.text);
    });

    if (_formKey.currentState!.validate() &&
        _emailError == null &&
        _passwordError == null &&
        _nameError == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Processing Data")));
    }
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter your email address";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter a valid email address, e.g. joe@mail.com";
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.length < 8) {
      return "Must be at least 8 characters long";
    }
    return null;
  }

  String? _validateName(String value) {
    if (value.isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: ListView(
            children: [
              SizedBox(height: 24),
              Text(
                "Create your account to save time \n & care more for your health",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField("Name", _nameController, false, _nameError),
                    SizedBox(height: 16),
                    _buildTextField(
                        "Email", _emailController, false, _emailError),
                    SizedBox(height: 16),
                    _buildTextField(
                        "Password", _passwordController, true, _passwordError),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _validateForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6FC0D3),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Or continue with",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Frame1000006082.png'),
                  const SizedBox(width: 20),
                  Image.asset('assets/images/Frame 1000006083.png'),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a Medora member? ",
                      style: TextStyle(fontSize: 14)),
                  GestureDetector(
                    onTap: () {
                      // الانتقال إلى شاشة تسجيل الدخول عند الضغط على "Login"
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginScreen()), // تأكد من أن لديك شاشة `LoginScreen`
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6FC0D3),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "By clicking Sign up or Log in, I agree to ",
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                  children: [
                    TextSpan(
                      text: "Medora’s\n Terms of Service",
                      style: TextStyle(color: Color(0xFF6FC0D3)),
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextSpan(
                      text: "Privacy Policy.",
                      style: TextStyle(color: Color(0xFF6FC0D3)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      bool isPassword, String? errorText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: isPassword ? _obscurePassword : false,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : Colors.grey,
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.error, color: Colors.red, size: 18),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  errorText,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(assetPath),
      ),
    );
  }
}
