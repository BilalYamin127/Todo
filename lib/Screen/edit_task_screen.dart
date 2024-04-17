// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_project/Providers/create_task_provider.dart';
import 'package:firebase_project/Providers/edit_task_provider.dart';
import 'package:firebase_project/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:firebase_project/model/task/task_model.dart';

class EditTaskScreen extends ConsumerStatefulWidget {
  const EditTaskScreen({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  ConsumerState<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends ConsumerState<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController taskNameController;
  late TextEditingController descriptionController;

  bool? iscomplete;

  @override
  void initState() {
    ref.read(editTaskProvider.notifier).editTaskget(widget.task);
    taskNameController = TextEditingController(text: widget.task.taskname);
    descriptionController =
        TextEditingController(text: widget.task.taskDescription);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategory = ref.watch(editTaskProvider).selectedCategory;
    final selectedDate = ref.watch(editTaskProvider).selectedDate;
    final selectedStartTime = ref.watch(editTaskProvider).selectedStartTime;
    final selectedEndTime = ref.watch(editTaskProvider).selectedEndTime;
    final selectedPriority = ref.watch(editTaskProvider).selectedPriority;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit your  task',
          style: TextStyle(color: AppColors.secondary),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Task Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // const SizedBox(height: 8),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        controller: taskNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter task name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter task name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 16),
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // const SizedBox(height: 15),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: Categoryenum.values.map((category) {
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(editTaskProvider.notifier)
                                  .selectCategory(category);
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: selectedCategory == category
                                    ? const Color.fromARGB(255, 151, 71, 255)
                                    : const Color.fromARGB(255, 224, 200, 255),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  category.toString().split('.').last,
                                  style: TextStyle(
                                    color: selectedCategory == category
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Text(
                      'Date and Time ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () => ref
                            .read(editTaskProvider.notifier)
                            .selectDate(context),
                        validator: (value) {
                          if (selectedDate == null) {
                            return 'Please select a date';
                          }
                          return null;
                        },
                        controller: TextEditingController(
                            text: selectedDate != null
                                ? DateFormat.yMd().format(selectedDate)
                                : ''),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Starting Time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: TextFormField(
                                    readOnly: true,
                                    onTap: () => ref
                                        .read(editTaskProvider.notifier)
                                        .selectTime(context, true),
                                    validator: (value) {
                                      if (selectedStartTime == null) {
                                        return 'Please select starting time';
                                      }
                                      return null;
                                    },
                                    controller: TextEditingController(
                                      text: selectedStartTime != null
                                          ? selectedStartTime.format(context)
                                          : 'starting time',
                                    ),
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.access_time,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Ending Time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                TextFormField(
                                  readOnly: true,
                                  onTap: () => ref
                                      .read(editTaskProvider.notifier)
                                      .selectTime(context, false),
                                  validator: (value) {
                                    if (selectedEndTime == null) {
                                      return 'Please select ending time';
                                    }
                                    return null;
                                  },
                                  controller: TextEditingController(
                                    text: selectedEndTime != null
                                        ? selectedEndTime.format(context)
                                        : 'Ending Time',
                                  ),
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.access_time,
                                      size: 20,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Priority',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // const SizedBox(height: 15),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: Priorityenum.values.map((priority) {
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(editTaskProvider.notifier)
                                  .selectPeriority(priority);
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: selectedPriority == priority
                                    ? const Color.fromARGB(255, 151, 71, 255)
                                    : const Color.fromARGB(255, 224, 200, 255),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  priority.toString().split('.').last,
                                  style: TextStyle(
                                    color: selectedPriority == priority
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      child: TextFormField(
                        controller: descriptionController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          hintText: 'Enter description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter description';
                          }
                          return null;
                        },
                      ),
                    ),
                    // const SizedBox(height: 12),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  TaskModel task = ref
                                      .read(editTaskProvider.notifier)
                                      .mapToTaskModel(
                                          descriptionController.text.toString(),
                                          taskNameController.text.toString());
                                  ref
                                      .read(editTaskProvider.notifier)
                                      .updateTaskInFirestore(task, context);
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 200,
                                color: const Color.fromARGB(255, 151, 71, 255),
                                child: const Center(
                                  child: Text(
                                    'Save Changes',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/create_task_bottom_right.png',
                height: 70,
                width: 100,
              ))
        ]),
      ),
    );
  }
}
