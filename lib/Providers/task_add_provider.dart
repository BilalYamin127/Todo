// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_project/model/task/task_model.dart';
// import 'package:firebase_project/ui/auth/Screen/task_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TaskState {
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController taskNameController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();

//   Categoryenum? selectedCategory;
//   Priorityenum? selectedPriority;
//   DateTime? _selectedDate;
//   TimeOfDay? _selectedStartTime;
//   TimeOfDay? _selectedEndTime;
// }

// class TaskNotifier extends Notifier<TaskState> {
//   @override
//   build() {
//     return TaskState();
//   }

//   TaskModel mapToTaskModel() {
//     DateTime now = DateTime.now();
//     var idd = now.microsecond.toString();
//     print('map task start');
//     return TaskModel(
//       taskCategory: TaskState().selectedCategory,
//       taskPriority: TaskState().selectedPriority,
//       taskDate: TaskState()._selectedDate,
//       taskStartTime: TaskState()._selectedStartTime,
//       taskEndTime: TaskState()._selectedEndTime,
//       taskDescription: TaskState().descriptionController.text,
//       taskname: TaskState().taskNameController.text,
//       id: idd,
//     );
//   }

//   Future<void> storeTaskInFirestore(TaskModel task) async {
//     try {
//       print('store tast start');
//       final firestore = FirebaseFirestore.instance;
//       final taskCollection = firestore.collection('Tasks');
//       Map<String, dynamic> taskdata = task.toJson();
//       print('this is task $taskdata');
//       await taskCollection.add(taskdata);
//       TaskState()._formKey.currentState?.reset();
//       print('User data stored in Firestore successfully');

//       // Show success message or navigate to another screen
//     } catch (e) {
//       // Handle errors
//       print('Error adding task: $e');
//       // Show error message
//     }
//   }
// }

// final Provider = NotifierProvider<TaskNotifier, TaskState>(TaskNotifier.new);
