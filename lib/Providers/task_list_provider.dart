// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/model/task/task_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListState {
  bool? loading;
  List<TaskModel>? tasks;
  TaskModel? task;
  TaskListState({
    this.loading,
    this.tasks,
    this.task,
  });

  TaskListState copyWith({
    bool? loading,
    List<TaskModel>? tasks,
    TaskModel? task,
  }) {
    return TaskListState(
      loading: loading ?? this.loading,
      tasks: tasks ?? this.tasks,
      task: task ?? this.task,
    );
  }

  @override
  String toString() =>
      'TaskListState(loading: $loading, tasks: $tasks, task: $task)';
}

class TaskListNotifier extends Notifier<TaskListState> {
  @override
  build() {
    return TaskListState(
      loading: false,
      tasks: [],
    );
  }

  void taskList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('Tasks').get();
    List<TaskModel> tasksList = [];
    for (var doc in snapshot.docs) {
      final task = TaskModel.fromJson(doc.data());

      tasksList.add(task);
      state = state.copyWith(tasks: tasksList);
    }
  }

  void deleteTask(TaskModel task) {
    FirebaseFirestore.instance.collection('Tasks').doc(task.id).delete();
    state.tasks!.remove(task);
  }

  void setISComplete(bool? newvalue, String? id) {
    FirebaseFirestore.instance.collection('Tasks').doc(id).update({
      'isCompleted': newvalue,
    });
  }
}

final taskListProvider =
    NotifierProvider<TaskListNotifier, TaskListState>(TaskListNotifier.new);
