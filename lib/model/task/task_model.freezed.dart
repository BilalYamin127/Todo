// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  Categoryenum get taskCategory => throw _privateConstructorUsedError;
  Priorityenum get taskPriority => throw _privateConstructorUsedError;
  DateTime get taskDate => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get taskStartTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get taskEndTime => throw _privateConstructorUsedError;
  String get taskDescription => throw _privateConstructorUsedError;
  String? get Id => throw _privateConstructorUsedError;
  String get taskname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {Categoryenum taskCategory,
      Priorityenum taskPriority,
      DateTime taskDate,
      @TimeOfDayConverter() TimeOfDay taskStartTime,
      @TimeOfDayConverter() TimeOfDay taskEndTime,
      String taskDescription,
      String? Id,
      String taskname});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskCategory = null,
    Object? taskPriority = null,
    Object? taskDate = null,
    Object? taskStartTime = null,
    Object? taskEndTime = null,
    Object? taskDescription = null,
    Object? Id = freezed,
    Object? taskname = null,
  }) {
    return _then(_value.copyWith(
      taskCategory: null == taskCategory
          ? _value.taskCategory
          : taskCategory // ignore: cast_nullable_to_non_nullable
              as Categoryenum,
      taskPriority: null == taskPriority
          ? _value.taskPriority
          : taskPriority // ignore: cast_nullable_to_non_nullable
              as Priorityenum,
      taskDate: null == taskDate
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taskStartTime: null == taskStartTime
          ? _value.taskStartTime
          : taskStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      taskEndTime: null == taskEndTime
          ? _value.taskEndTime
          : taskEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      taskDescription: null == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      Id: freezed == Id
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as String?,
      taskname: null == taskname
          ? _value.taskname
          : taskname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Categoryenum taskCategory,
      Priorityenum taskPriority,
      DateTime taskDate,
      @TimeOfDayConverter() TimeOfDay taskStartTime,
      @TimeOfDayConverter() TimeOfDay taskEndTime,
      String taskDescription,
      String? Id,
      String taskname});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskCategory = null,
    Object? taskPriority = null,
    Object? taskDate = null,
    Object? taskStartTime = null,
    Object? taskEndTime = null,
    Object? taskDescription = null,
    Object? Id = freezed,
    Object? taskname = null,
  }) {
    return _then(_$TaskModelImpl(
      null == taskCategory
          ? _value.taskCategory
          : taskCategory // ignore: cast_nullable_to_non_nullable
              as Categoryenum,
      null == taskPriority
          ? _value.taskPriority
          : taskPriority // ignore: cast_nullable_to_non_nullable
              as Priorityenum,
      null == taskDate
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == taskStartTime
          ? _value.taskStartTime
          : taskStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      null == taskEndTime
          ? _value.taskEndTime
          : taskEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      null == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == Id
          ? _value.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as String?,
      null == taskname
          ? _value.taskname
          : taskname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl implements _TaskModel {
  _$TaskModelImpl(
      this.taskCategory,
      this.taskPriority,
      this.taskDate,
      @TimeOfDayConverter() this.taskStartTime,
      @TimeOfDayConverter() this.taskEndTime,
      this.taskDescription,
      this.Id,
      this.taskname);

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final Categoryenum taskCategory;
  @override
  final Priorityenum taskPriority;
  @override
  final DateTime taskDate;
  @override
  @TimeOfDayConverter()
  final TimeOfDay taskStartTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay taskEndTime;
  @override
  final String taskDescription;
  @override
  final String? Id;
  @override
  final String taskname;

  @override
  String toString() {
    return 'TaskModel(taskCategory: $taskCategory, taskPriority: $taskPriority, taskDate: $taskDate, taskStartTime: $taskStartTime, taskEndTime: $taskEndTime, taskDescription: $taskDescription, Id: $Id, taskname: $taskname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.taskCategory, taskCategory) ||
                other.taskCategory == taskCategory) &&
            (identical(other.taskPriority, taskPriority) ||
                other.taskPriority == taskPriority) &&
            (identical(other.taskDate, taskDate) ||
                other.taskDate == taskDate) &&
            (identical(other.taskStartTime, taskStartTime) ||
                other.taskStartTime == taskStartTime) &&
            (identical(other.taskEndTime, taskEndTime) ||
                other.taskEndTime == taskEndTime) &&
            (identical(other.taskDescription, taskDescription) ||
                other.taskDescription == taskDescription) &&
            (identical(other.Id, Id) || other.Id == Id) &&
            (identical(other.taskname, taskname) ||
                other.taskname == taskname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, taskCategory, taskPriority,
      taskDate, taskStartTime, taskEndTime, taskDescription, Id, taskname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  factory _TaskModel(
      final Categoryenum taskCategory,
      final Priorityenum taskPriority,
      final DateTime taskDate,
      @TimeOfDayConverter() final TimeOfDay taskStartTime,
      @TimeOfDayConverter() final TimeOfDay taskEndTime,
      final String taskDescription,
      final String? Id,
      final String taskname) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  Categoryenum get taskCategory;
  @override
  Priorityenum get taskPriority;
  @override
  DateTime get taskDate;
  @override
  @TimeOfDayConverter()
  TimeOfDay get taskStartTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay get taskEndTime;
  @override
  String get taskDescription;
  @override
  String? get Id;
  @override
  String get taskname;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
