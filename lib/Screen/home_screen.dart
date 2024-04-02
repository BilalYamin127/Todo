// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/Providers/category_couter_provider.dart';
import 'package:firebase_project/Providers/user_details.dart';

import 'package:firebase_project/Screen/edit_task_screen.dart';
import 'package:firebase_project/Screen/logout_screen.dart';
import 'package:firebase_project/Screen/create_task_screen.dart';
import 'package:firebase_project/widgets/container.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(userProvider.notifier).getUser();
      ref
          .read(categoryCountsProvider.notifier)
          .updateCategoryCountsFromFirestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).userModel;
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
                            'Welcome,${user!.username}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogOut()),
                            );
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        count: ref.watch(categoryCountsProvider).projects ?? 0,
                        icon: const Icon(Icons.speaker),
                        title: 'Projects',
                        color: const Color.fromARGB(255, 180, 196, 255),
                      ),
                      CustomContainer(
                        count: ref.watch(categoryCountsProvider).work ?? 0,
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
                        count:
                            ref.watch(categoryCountsProvider).dailyTasks ?? 0,
                        icon: const Icon(Icons.task),
                        title: 'Daily Tasks',
                        color: const Color.fromARGB(255, 193, 145, 255),
                      ),
                      CustomContainer(
                        count: ref.watch(categoryCountsProvider).groceries ?? 0,
                        icon: const Icon(Icons.local_grocery_store),
                        title: 'Groceries',
                        color: const Color.fromARGB(255, 244, 216, 177),
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

                        // if (snapshot.connectionState ==
                        //     ConnectionState.waiting) {
                        //   return const CircularProgressIndicator();
                        // }

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
                                color: datadoc['isCompleted']
                                    ? const Color.fromARGB(255, 206, 255, 219)
                                    : Colors.white,
                                border: Border.all(
                                  color: Color.fromARGB(20, 22, 10, 9),
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
                                  checkColor:
                                      Colors.white, // Color of the check icon
                                  activeColor: Color.fromARGB(255, 52, 168, 83),
                                  tristate: false,
                                  shape: const CircleBorder(),
                                  value: datadoc['isCompleted'],
                                  onChanged: (bool? newValue) {
                                    FirebaseFirestore.instance
                                        .collection('Tasks')
                                        .doc(document.id)
                                        .update({
                                      'isCompleted': newValue,
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

                                        // setState(() {
                                        //   getCategoryCounts();
                                        // });
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Tasks')
                                            .doc(document.id)
                                            .delete();
                                        // setState(() {
                                        //   getCategoryCounts();
                                        // });
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TasksScreen(),
                            ),
                          );
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
