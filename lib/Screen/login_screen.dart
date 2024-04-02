import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_project/Screen/home_screen.dart';
import 'package:firebase_project/Screen/sign_up_screen.dart';
import 'package:firebase_project/widgets/text_field.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString());

      if (!mounted) return;
      User? user = userCredential.user;

      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(' User does not exist. try to Sign Up'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(230, 235, 195, 136),
                Color.fromARGB(200, 210, 187, 240),
                Color.fromARGB(255, 233, 167, 90),
              ],
            ),
          ),
          child: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Welcome Back !',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 70,
                              child: CustomTextFormFiled(
                                controller: emailController,
                                hintText: 'john@gmail.com',
                                suffixText: 'Email',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Email ';
                                  }
                                  if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              child: CustomTextFormFiled(
                                controller: passwordController,
                                hintText: '********',
                                suffixText: 'Password',
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    login();
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(Colors
                                          .black), // Set background color to white
                                  // Set border color to black
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Don\'t have an account? '),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUpScreen()));
                                    },
                                    child: const Text('Sign up'),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Opacity(
                          opacity:
                              0.6, // Specify the opacity level here (0.0 to 1.0)
                          child: Image.asset(
                            'assets/images/login_top_left.png',
                            height: 120,
                            width: 120,
                          ),
                        ),
                        const Positioned(
                            left: 30,
                            top: 40,
                            child: Text(
                              'TodoHive',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/login_bottom_right.png',
                            height: 120,
                            width: 120,
                          ),
                        ))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
