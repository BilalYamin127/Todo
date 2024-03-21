// Inside HomeScreen class

import 'package:firebase_project/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  final User? user;

  HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Use the user details as needed
    return Scaffold(
        body: Container(
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
        child: CusotmContainer(
          color: Colors.red,
          count: 5,
          title: 'bilal',
          icon: Icon(Icons.headphones),
        ),
      ),
    ));
  }
}
