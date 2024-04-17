import 'package:firebase_project/Providers/create_task_provider.dart';
import 'package:firebase_project/Providers/task_list_provider.dart';
import 'package:firebase_project/model/task/task_model.dart';
import 'package:firebase_project/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({super.key});

  @override
  ConsumerState<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends ConsumerState<TasksScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    taskNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(taskListProvider.notifier).taskList();
    // final createTaskState = ref.watch(createTaskProvider);
    final selectedCategory = ref.watch(createTaskProvider).selectedCategory;
    final selectedDate = ref.watch(createTaskProvider).selectedDate;
    final selectedStartTime = ref.watch(createTaskProvider).selectedStartTime;
    final selectedEndTime = ref.watch(createTaskProvider).selectedEndTime;
    final selectedPriority = ref.watch(createTaskProvider).selectedPriority;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new task'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
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
                      Text(
                        'Task Name',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.fieldTextcolor,
                            ),
                      ),
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
                      const Text(
                        'Category',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.fieldTextcolor),
                      ),
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: Categoryenum.values.map((category) {
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(createTaskProvider.notifier)
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
                                      : const Color.fromARGB(
                                          255, 224, 200, 255),
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
                        'Date ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.fieldTextcolor,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          readOnly: true,
                          onTap: () => ref
                              .read(createTaskProvider.notifier)
                              .selectDate(context),
                          validator: (value) {
                            if (selectedDate == null) {
                              return 'Please select a date';
                            }
                            return null;
                          },
                          controller: TextEditingController(
                              text: selectedDate != null
                                  ? DateFormat.yMd().format(
                                      selectedDate,
                                    )
                                  : ' Date'),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                          ),
                        ),
                      ),
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
                                        color: AppColors.fieldTextcolor),
                                  ),
                                  SizedBox(
                                    height: 80,
                                    child: TextFormField(
                                      readOnly: true,
                                      onTap: () => ref
                                          .read(createTaskProvider.notifier)
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
                                        color: AppColors.fieldTextcolor),
                                  ),
                                  TextFormField(
                                    readOnly: true,
                                    onTap: () => ref
                                        .read(createTaskProvider.notifier)
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)),
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
                            color: AppColors.fieldTextcolor),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: Priorityenum.values.map((priority) {
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(createTaskProvider.notifier)
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
                                      : const Color.fromARGB(
                                          255, 224, 200, 255),
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
                            color: AppColors.fieldTextcolor),
                      ),
                      SizedBox(
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: 'Enter description',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
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
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    ref
                                        .read(taskListProvider.notifier)
                                        .taskList();
                                    TaskModel task = ref
                                        .read(createTaskProvider.notifier)
                                        .mapToTaskModel(
                                            descriptionController.text
                                                .toString(),
                                            taskNameController.text.toString());

                                    ref
                                        .read(createTaskProvider.notifier)
                                        .updateTaskInFirestore(task, context);
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 200,
                                  color:
                                      const Color.fromARGB(255, 151, 71, 255),
                                  child: const Center(
                                    child: Text(
                                      'Create  Task',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
