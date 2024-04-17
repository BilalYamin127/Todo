// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_project/model/task/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Categoryenum { projects, work, dailytasks, groceries }

enum Priorityenum { low, medium, high }

class CreateTaskState {
  Categoryenum? selectedCategory;
  Priorityenum? selectedPriority;
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  CreateTaskState({
    this.selectedCategory,
    this.selectedPriority,
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
  });

  CreateTaskState copyWith({
    Categoryenum? selectedCategory,
    Priorityenum? selectedPriority,
    DateTime? selectedDate,
    TimeOfDay? selectedStartTime,
    TimeOfDay? selectedEndTime,
  }) {
    return CreateTaskState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedPriority: selectedPriority ?? this.selectedPriority,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedStartTime: selectedStartTime ?? this.selectedStartTime,
      selectedEndTime: selectedEndTime ?? this.selectedEndTime,
    );
  }

  @override
  String toString() {
    return 'CreateTaskState(selectedCategory: $selectedCategory, selectedPriority: $selectedPriority, selectedDate: $selectedDate, selectedStartTime: $selectedStartTime, selectedEndTime: $selectedEndTime)';
  }

  factory CreateTaskState.initial() => CreateTaskState(
        selectedCategory: Categoryenum.projects,
        selectedPriority: Priorityenum.low,
      );
}

class CreateTaskNotifier extends Notifier<CreateTaskState> {
  @override
  build() {
    return CreateTaskState.initial();
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(pickedDate);
      DateTime formattedDateTime = DateTime.parse(formattedDate);

      state = state.copyWith(selectedDate: formattedDateTime);
    }
  }

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? state.selectedStartTime ?? TimeOfDay.now()
          : state.selectedEndTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      if (isStartTime) {
        state = state.copyWith(selectedStartTime: pickedTime);
      } else {
        state = state.copyWith(selectedEndTime: pickedTime);
      }
    }
  }

  void selectCategory(Categoryenum category) {
    state = state.copyWith(selectedCategory: category);
  }

  void selectPeriority(Priorityenum priority) {
    state = state.copyWith(selectedPriority: priority);
  }

  Future<void> createTaskInFirestore(
      TaskModel task, BuildContext context) async {
    final formKey = GlobalKey<FormState>();
    try {
      final firestore = FirebaseFirestore.instance;
      final taskCollection = firestore.collection('Tasks');
      Map<String, dynamic> taskdata = task.toJson();
      await taskCollection.doc(task.id).set(taskdata);
      formKey.currentState?.reset();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Task stored in Firestore successfully'),
        ),
      );

      if (!context.mounted) return;
      Navigator.of(context).pop();
      // Show success message or navigate to another screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('error adding Task $e'),
        ),
      );
    }
  }

  // Map user-entered data to TaskModel
  TaskModel mapToTaskModel(String des, String name) {
    var now = const Uuid();
    var uuid = now.v4();
    var idd = uuid.toString();
    return TaskModel(
      taskCategory: state.selectedCategory,
      taskPriority: state.selectedPriority,
      taskDate: state.selectedDate,
      taskStartTime: state.selectedStartTime,
      taskEndTime: state.selectedEndTime,
      taskDescription: des,
      taskname: name,
      id: idd,
      isCompleted: false,
    );
  }

  void reset() {
    state = CreateTaskState.initial();
  }
}

final createTaskProvider =
    NotifierProvider<CreateTaskNotifier, CreateTaskState>(
        CreateTaskNotifier.new);
