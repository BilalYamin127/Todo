import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:firebase_project/Providers/create_task_provider.dart';
import 'package:firebase_project/model/task/task_model.dart';

class EditTaskState {
  Categoryenum? selectedCategory;
  Priorityenum? selectedPriority;
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  bool? isCompleted;
  TaskModel? taskModel;
  EditTaskState({
    this.selectedCategory,
    this.selectedPriority,
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
    this.isCompleted,
    this.taskModel,
  });

  EditTaskState copyWith({
    Categoryenum? selectedCategory,
    Priorityenum? selectedPriority,
    DateTime? selectedDate,
    TimeOfDay? selectedStartTime,
    TimeOfDay? selectedEndTime,
    bool? isCompleted,
    TaskModel? taskModel,
  }) {
    return EditTaskState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedPriority: selectedPriority ?? this.selectedPriority,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedStartTime: selectedStartTime ?? this.selectedStartTime,
      selectedEndTime: selectedEndTime ?? this.selectedEndTime,
      isCompleted: isCompleted ?? this.isCompleted,
      taskModel: taskModel ?? this.taskModel,
    );
  }

  factory EditTaskState.initial() => EditTaskState(
        //isCompleted: false,
        selectedCategory: Categoryenum.projects,
        selectedPriority: Priorityenum.low,
        // selectedDate: DateTime.now(),
        // selectedStartTime: TimeOfDay.now(),
        // selectedEndTime: TimeOfDay.now(),
      );

  @override
  String toString() {
    return 'EditTaskState(selectedCategory: $selectedCategory, selectedPriority: $selectedPriority, selectedDate: $selectedDate, selectedStartTime: $selectedStartTime, selectedEndTime: $selectedEndTime, isCompleted: $isCompleted, taskModel: $taskModel)';
  }
}

class EditTaskNotifier extends Notifier<EditTaskState> {
  @override
  build() {
    return EditTaskState.initial();
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

  TaskModel mapToTaskModel(String des, String name) {
    var idd = state.taskModel!.id;
    return TaskModel(
      taskCategory: state.selectedCategory,
      taskPriority: state.selectedPriority,
      taskDate: state.selectedDate,
      taskStartTime: state.selectedStartTime,
      taskEndTime: state.selectedEndTime,
      taskDescription: des,
      taskname: name,
      id: idd,
      isCompleted: state.isCompleted,
    );
  }

  void editTaskget(TaskModel task) async {
    state = state.copyWith(
        isCompleted: task.isCompleted,
        selectedCategory: task.taskCategory,
        selectedDate: task.taskDate,
        selectedEndTime: task.taskEndTime,
        selectedStartTime: task.taskStartTime,
        selectedPriority: task.taskPriority,
        taskModel: task);
  }

  Future<void> updateTaskInFirestore(
      TaskModel task, BuildContext context) async {
    try {
      print(task.id);
      final firestore = FirebaseFirestore.instance;
      final taskCollection = firestore.collection('Tasks');
      Map<String, dynamic> taskdata = task.toJson();
      await taskCollection.doc(task.id).update(taskdata);
      //_formKey.currentState?.reset();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Task Update in Firestore successfully'),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Error in Updating the User$e'),
        ),
      );
    }
  }
}

final editTaskProvider =
    NotifierProvider<EditTaskNotifier, EditTaskState>(EditTaskNotifier.new);
