import 'package:firebase_project/Providers/create_task_provider.dart';
import 'package:firebase_project/converter/time_of_day_converter.dart';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  factory TaskModel({
    Categoryenum? taskCategory,
    Priorityenum? taskPriority,
    DateTime? taskDate,
    bool? isCompleted,
    @TimeOfDayConverter() TimeOfDay? taskStartTime,
    @TimeOfDayConverter() TimeOfDay? taskEndTime,
    String? taskDescription,
    String? id,
    String? taskname,
  }) = _TaskModel;
  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
