import 'package:firebase_project/Providers/signup_provider.dart';
import 'package:firebase_project/Screen/login_screen.dart';
import 'package:firebase_project/widgets/text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> signupformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var signupp = ref.watch(signupprovider);
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
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Sign Up ',
                          style: TextStyle(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const CircleAvatar(
                          radius: 50, // Adjust the radius as needed
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          backgroundImage: AssetImage(
                              'assets/images/signup_profile.png'), // Replace 'background_image.jpg' with your asset image path
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: signupformKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
                                child: CustomTextFormFiled(
                                  controller: signupp.emailController,
                                  autofocus: true,
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
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                child: CustomTextFormFiled(
                                  controller: signupp.usernameController,
                                  hintText: 'bilalYamin123.. etc',
                                  suffixText: 'Username',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter UserName ';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                child: CustomTextFormFiled(
                                  controller: signupp.passwordController,
                                  obscureText: true,
                                  hintText: '********',
                                  suffixText: 'Password',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password ';
                                    }
                                    if (value.length < 6) {
                                      return 'Password not less than 6 characteer';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                child: CustomTextFormFiled(
                                  controller: signupp.confirmPasswordController,
                                  obscureText: true,
                                  hintText: '********',
                                  suffixText: 'Confirm Password',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Confirm Password ';
                                    }
                                    if (value !=
                                        signupp.passwordController.text) {
                                      return 'Passwords do not match';
                                    }

                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              const SizedBox(
                                height: 23,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (signupformKey.currentState!
                                        .validate()) {
                                      ref
                                          .read(signupprovider.notifier)
                                          .createUserWithEmailAndPassword(
                                              signupp.emailController.text
                                                  .toString(),
                                              signupp.passwordController.text
                                                  .toString(),
                                              signupp.usernameController.text
                                                  .toString());
                                      Navigator.pop(context);
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(Colors
                                            .black), // Set background color to white
                                    // Set border color to black
                                  ),
                                  child: const Text(
                                    'Sign UP',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already  have an account? '),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                child: const Text('Login'),
                              ),
                            ]),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset(
                        'assets/images/signup_top_right.png',
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(
                          'assets/images/signup_bottum_left.png',
                          height: 120,
                          width: 120,
                        ),
                      )),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
