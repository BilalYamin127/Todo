// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      $enumDecode(_$CategoryenumEnumMap, json['taskCategory']),
      $enumDecode(_$PriorityenumEnumMap, json['taskPriority']),
      DateTime.parse(json['taskDate'] as String),
      const TimeOfDayConverter().fromJson(json['taskStartTime'] as String),
      const TimeOfDayConverter().fromJson(json['taskEndTime'] as String),
      json['taskDescription'] as String,
      json['Id'] as String?,
      json['taskname'] as String,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'taskCategory': _$CategoryenumEnumMap[instance.taskCategory]!,
      'taskPriority': _$PriorityenumEnumMap[instance.taskPriority]!,
      'taskDate': instance.taskDate.toIso8601String(),
      'taskStartTime':
          const TimeOfDayConverter().toJson(instance.taskStartTime),
      'taskEndTime': const TimeOfDayConverter().toJson(instance.taskEndTime),
      'taskDescription': instance.taskDescription,
      'Id': instance.Id,
      'taskname': instance.taskname,
    };

const _$CategoryenumEnumMap = {
  Categoryenum.projects: 'projects',
  Categoryenum.work: 'work',
  Categoryenum.groceries: 'groceries',
  Categoryenum.dailytasks: 'dailytasks',
};

const _$PriorityenumEnumMap = {
  Priorityenum.low: 'low',
  Priorityenum.medium: 'medium',
  Priorityenum.high: 'high',
};
