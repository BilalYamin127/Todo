import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/ui/auth/Screen/edit_task_screen.dart';
import 'package:firebase_project/ui/auth/Screen/logout_screen.dart';
import 'package:firebase_project/ui/auth/Screen/create_task_screen.dart';
import 'package:firebase_project/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  final User? user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int work = 0;
  int groc = 0;
  int daily = 0;
  int pro = 0;

  @override
  void initState() {
    super.initState();
    getCategoryCounts();
  }

  void getCategoryCounts() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot works = await firestore
        .collection('Tasks')
        .where('taskCategory', isEqualTo: 'work')
        .get();
    setState(() {
      work = works.size;
    });
    QuerySnapshot projects = await firestore
        .collection('Tasks')
        .where('taskCategory', isEqualTo: 'projects')
        .get();
    setState(() {
      pro = projects.size;
    });
    QuerySnapshot dailytask = await firestore
        .collection('Tasks')
        .where('taskCategory', isEqualTo: 'dailytasks')
        .get();
    setState(() {
      daily = dailytask.size;
    });
    QuerySnapshot groceries = await firestore
        .collection('Tasks')
        .where('taskCategory', isEqualTo: 'groceries')
        .get();
    setState(() {
      groc = groceries.size;
    });
  }

  void movetoLogout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogOut(user: widget.user)),
    );
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
        child: Stack(
          children: [
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
                          onTap: movetoLogout,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        count: pro,
                        icon: const Icon(Icons.speaker),
                        title: 'Projects',
                        color: const Color.fromARGB(255, 180, 196, 255),
                      ),
                      CustomContainer(
                        count: work,
                        icon: const Icon(Icons.work),
                        title: 'Work',
                        color: const Color.fromARGB(255, 207, 243, 233),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        count: daily,
                        icon: const Icon(Icons.task),
                        title: 'Daily Tasks',
                        color: const Color.fromARGB(255, 193, 145, 255),
                      ),
                      CustomContainer(
                        count: groc,
                        icon: const Icon(Icons.local_grocery_store),
                        title: 'Groceries',
                        color: Color.fromARGB(255, 244, 216, 177),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Today\'s Tasks'),
                  SizedBox(
                    height: 250,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Tasks')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot document =
                                snapshot.data!.docs[index];
                            Map<String, dynamic> datadoc =
                                document.data() as Map<String, dynamic>;

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 22, 10, 9),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      datadoc['taskname'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      datadoc['taskStartTime'],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditTaskScreen(
                                              dataDoc: datadoc,
                                              id: document.id,
                                            ),
                                          ),
                                        );
                                        setState(() {
                                          getCategoryCounts();
                                        });
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Tasks')
                                            .doc(document.id)
                                            .delete();
                                        setState(() {
                                          getCategoryCounts();
                                        });
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
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TasksScreen(),
                              ),
                            );
                            getCategoryCounts();
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 350,
                          color: const Color.fromARGB(255, 151, 71, 255),
                          child: const Center(
                            child: Text(
                              'Create new Task',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
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
          ],
        ),
      ),
    );
  }
}
