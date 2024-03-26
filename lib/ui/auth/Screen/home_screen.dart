import 'package:firebase_project/ui/auth/Screen/logout_screen.dart';
import 'package:firebase_project/ui/auth/Screen/task_screen.dart';
import 'package:firebase_project/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  final User? user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void movetoLogout() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LogOut(user: widget.user)));
  }

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 243, 243, 244),
              Color.fromARGB(255, 253, 253, 253),
            ],
          ),
        ),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Welcome, ${widget.user?.email ?? 'User'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          movetoLogout();
                        },
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/home_profile.png'),
                          radius: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                        count: 5,
                        icon: Icon(Icons.speaker),
                        title: 'Projects',
                        color: Color.fromARGB(255, 180, 196, 255)),
                    CustomContainer(
                        count: 5,
                        icon: Icon(Icons.work),
                        title: 'work',
                        color: Color.fromARGB(255, 207, 243, 233))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                        count: 2,
                        icon: Icon(Icons.task),
                        title: 'Daily Tasks',
                        color: Color.fromARGB(255, 193, 145, 255)),
                    CustomContainer(
                        count: 5,
                        icon: Icon(Icons.local_grocery_store),
                        title: 'Groceries ',
                        color: Color.fromARGB(255, 244, 216, 177))
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Todays Tasks'),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 22, 10, 9),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          //shape property is not working so that why i am using container
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          leading: Checkbox(
                            shape: const CircleBorder(),
                            value: _selectedIndex == index,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _selectedIndex = newValue! ? index : -1;
                              });
                            },
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Task ${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Description of Task ${index + 1}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Handle your edit button action here
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Handle your delete button action here
                                },
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TasksScreen()));
                      },
                      child: Container(
                          height: 60,
                          width: 350,
                          color: const Color.fromARGB(255, 151, 71, 255),
                          child: const Center(
                              child: Text(
                            'Create new  Task',
                            style: TextStyle(color: Colors.white),
                          ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/images/home_top_lef.png',
                height: 60,
                width: 60,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
