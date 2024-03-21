//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/firebase_services/firebase_services.dart';
import 'package:firebase_project/model/User/user_model.dart';

import 'package:firebase_project/ui/auth/Screen/login.dart';
import 'package:firebase_project/widgets/text_field.dart';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  final userservice = FirebaseAuthServices();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> storeUserDataInFirestore(User user, UserModel userModel) async {
    try {
      // Get a reference to the Firestore instance
      final firestore = FirebaseFirestore.instance;

      // Get the UID of the user
      final uid = user.uid;

      // Get a reference to the collection based on the UID
      final userCollection = firestore.collection('Users');

      // Serialize UserModel instance into a Map
      final userData = userModel.toJson();

      // Add user data document to the collection
      await userCollection.add(userData);

      print('User data stored in Firestore successfully');
    } catch (e) {
      // Handle any errors
      print('Error storing user data: $e');
    }
  }

  void createUserWithFirebaseAuth() async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );

      // Get user data
      User user = userCredential.user!;

      // Create UserModel instance with desired data
      UserModel userModel = UserModel(
        email: emailController.text.toString(),
        username: usernameController.text.toString(),
        password: passwordController.text.toString(),
        id: user.uid,

        // Add any other fields you want to store
      );

      // Store user data in Firestore
      await storeUserDataInFirestore(user, userModel);

      print('User data stored in Firestore successfully');
    } catch (e) {
      // Handle any errors
      print('Error creating user: $e');
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
                          key: formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
                                child: CustomTextFormFiled(
                                  controller: emailController,
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
                                  controller: usernameController,
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
                                  controller: passwordController,
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
                                  controller: confirmPasswordController,
                                  obscureText: true,
                                  hintText: '********',
                                  suffixText: 'Confirm Password',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Confirm Password ';
                                    }
                                    if (value != passwordController.text) {
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
                                    if (formkey.currentState!.validate()) {
                                      createUserWithFirebaseAuth();
                                    }
                                    ;
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
