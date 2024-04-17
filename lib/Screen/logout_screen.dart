import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Providers/fetch_user_provider.dart';
import 'package:firebase_project/Providers/theme_provider.dart';
import 'package:firebase_project/Screen/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogOut extends ConsumerStatefulWidget {
  const LogOut({super.key});

  @override
  ConsumerState<LogOut> createState() => _LogOutState();
}

class _LogOutState extends ConsumerState<LogOut> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).userModel;
    final modeProvider = ref.watch(modeChangeProvider.notifier);
    final isDarkMode = ref.watch(modeChangeProvider).isDarkMode ?? false;

    return Scaffold(
      body: Stack(children: [
        Column(children: [
          Container(
            height: 350,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(230, 235, 195, 136),
                  Color.fromARGB(200, 210, 187, 240),
                  Color.fromARGB(199, 190, 154, 237),
                  Color.fromARGB(255, 233, 167, 90),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(55, 177, 144, 229))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 90,
                        backgroundImage:
                            AssetImage('assets/images/logout_profile.png'),
                      ),
                      Text(
                        ' ${user?.username ?? 'user not found'}',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    child: Text(user?.email ?? 'not found email',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Container(
                  height: 60,
                  width: 150,
                  color: const Color.fromARGB(255, 151, 71, 255),
                  child: Center(
                      child: Text(
                    'Log out',
                    style: Theme.of(context).textTheme.displayLarge,
                  ))),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Switch Mode ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  if (value) {
                    modeProvider.setDarkMode();
                  } else {
                    modeProvider.setLightMode();
                  }
                },
              )
            ],
          )
        ]),
        Positioned(
          bottom: 0,
          right: 0,
          height: 100,
          width: 100,
          child: Image.asset('assets/images/logout_bottum_left.png'),
        ),
        Positioned(
            left: 12,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ))
      ]),
    );
  }
}
