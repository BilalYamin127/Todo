import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Screen/home_screen.dart';
import 'package:firebase_project/Screen/login_screen.dart';
import 'package:firebase_project/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(230, 243, 198, 132),
              Color.fromARGB(200, 210, 187, 240),
              Color.fromARGB(255, 233, 167, 90),
              Color.fromARGB(199, 189, 146, 245),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Group.png',
                    height: 40,
                  ),
                  Text('TodoHive',
                      style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
              const SizedBox(
                  height: 16), // Add some space between the text widgets
              Text('Innovative, user-friendly,\n and easy.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 24), // Add more space before the button
              InkWell(
                onTap: () {
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    // User is already logged in, navigate to home screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  } else {
                    // User is not logged in, navigate to login screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(12)) // Set border color to black
                        ),
                    child: Center(
                        child: Text(
                      style: Theme.of(context).textTheme.titleLarge,
                      'Get Started  ->',
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
