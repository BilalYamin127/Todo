// ignore_for_file: must_be_immutable

import 'package:firebase_project/Providers/category_couter_provider.dart';
import 'package:firebase_project/Providers/create_task_provider.dart';

import 'package:firebase_project/Providers/fetch_user_provider.dart';
import 'package:firebase_project/Providers/task_list_provider.dart';
import 'package:firebase_project/Screen/edit_task_screen.dart';
import 'package:firebase_project/Screen/logout_screen.dart';
import 'package:firebase_project/Screen/create_task_screen.dart';
import 'package:firebase_project/theme/app_color/app_color.dart';
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
      ref.read(taskListProvider.notifier).taskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).userModel;

    final tasklist = ref.watch(taskListProvider).tasks;
    ref.watch(taskListProvider.notifier).taskList();

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                                'Welcome,${user?.username ?? ' user not found'}',
                                style: Theme.of(context).textTheme.bodyLarge),
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
                          count:
                              ref.watch(categoryCountsProvider).projects ?? 0,
                          icon: const Icon(Icons.speaker),
                          title: 'Projects ',
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
                              ref.watch(categoryCountsProvider).groceries ?? 0,
                          icon: const Icon(Icons.local_grocery_store),
                          title: 'Groceries',
                          color: const Color.fromARGB(255, 244, 216, 177),
                        ),
                        CustomContainer(
                          count:
                              ref.watch(categoryCountsProvider).dailyTasks ?? 0,
                          icon: const Icon(Icons.task),
                          title: 'Daily Tasks',
                          color: const Color.fromARGB(255, 193, 145, 255),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Today\'s Tasks',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.48,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: tasklist?.length ?? 0,
                          itemBuilder: (context, index) {
                            final task = tasklist![index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: task.isCompleted ?? false
                                    ? const Color.fromARGB(255, 206, 255, 219)
                                    : Colors.white,
                                border: Border.all(
                                  color: const Color.fromARGB(20, 22, 10, 9),
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
                                  checkColor: Colors.white,
                                  activeColor:
                                      const Color.fromARGB(255, 52, 168, 83),
                                  tristate: false,
                                  shape: const CircleBorder(),
                                  value: task.isCompleted,
                                  onChanged: (bool? newValue) {
                                    ref
                                        .read(taskListProvider.notifier)
                                        .setISComplete(newValue, task.id);
                                  },
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Adjust alignment
                                  children: [
                                    Text(
                                      task.taskname ?? 'not found',
                                      style: const TextStyle(
                                          color: Colors.black), // Use headline6
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          task.taskStartTime?.format(context) ??
                                              "",
                                          style: const TextStyle(
                                              color: Color.fromARGB(255, 126,
                                                  119, 147)), // Use subtitle1
                                        ),
                                        const Text(
                                          ' to ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 126, 119, 147)),
                                        ),
                                        Text(
                                          task.taskEndTime?.format(context) ??
                                              "",
                                          style: const TextStyle(
                                              color: Color.fromARGB(255, 126,
                                                  119, 147)), // Use subtitle1
                                        ),
                                      ],
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
                                              task: task,
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        ref
                                            .read(taskListProvider.notifier)
                                            .deleteTask(task);
                                        ref
                                            .watch(taskListProvider.notifier)
                                            .taskList();
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
                        )),
                    const SizedBox(height: 20),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: () {
                            ref.read(createTaskProvider.notifier).reset();
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
                            child: Center(
                              child: Text('Create new Task',
                                  style:
                                      Theme.of(context).textTheme.displayLarge),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
    );
  }
}
