import 'package:firebase_project/converter/time_of_day_converter.dart';
import 'package:firebase_project/ui/auth/Screen/task_screen.dart';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  factory TaskModel(
      Categoryenum taskCategory,
      Priorityenum taskPriority,
      DateTime taskDate,
      @TimeOfDayConverter() TimeOfDay taskStartTime,
      @TimeOfDayConverter() TimeOfDay taskEndTime,
      String taskDescription,
      String? Id,
      String taskname) = _TaskModel;
  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
