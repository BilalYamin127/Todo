// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      taskCategory:
          $enumDecodeNullable(_$CategoryenumEnumMap, json['taskCategory']),
      taskPriority:
          $enumDecodeNullable(_$PriorityenumEnumMap, json['taskPriority']),
      taskDate: json['taskDate'] == null
          ? null
          : DateTime.parse(json['taskDate'] as String),
      taskStartTime: _$JsonConverterFromJson<String, TimeOfDay>(
          json['taskStartTime'], const TimeOfDayConverter().fromJson),
      taskEndTime: _$JsonConverterFromJson<String, TimeOfDay>(
          json['taskEndTime'], const TimeOfDayConverter().fromJson),
      taskDescription: json['taskDescription'] as String?,
      id: json['id'] as String?,
      taskname: json['taskname'] as String?,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'taskCategory': _$CategoryenumEnumMap[instance.taskCategory],
      'taskPriority': _$PriorityenumEnumMap[instance.taskPriority],
      'taskDate': instance.taskDate?.toIso8601String(),
      'taskStartTime': _$JsonConverterToJson<String, TimeOfDay>(
          instance.taskStartTime, const TimeOfDayConverter().toJson),
      'taskEndTime': _$JsonConverterToJson<String, TimeOfDay>(
          instance.taskEndTime, const TimeOfDayConverter().toJson),
      'taskDescription': instance.taskDescription,
      'id': instance.id,
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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
