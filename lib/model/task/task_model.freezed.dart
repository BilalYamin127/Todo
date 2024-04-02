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
  Categoryenum? get taskCategory => throw _privateConstructorUsedError;
  Priorityenum? get taskPriority => throw _privateConstructorUsedError;
  DateTime? get taskDate => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get taskStartTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get taskEndTime => throw _privateConstructorUsedError;
  String? get taskDescription => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get taskname => throw _privateConstructorUsedError;

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
      {Categoryenum? taskCategory,
      Priorityenum? taskPriority,
      DateTime? taskDate,
      bool? isCompleted,
      @TimeOfDayConverter() TimeOfDay? taskStartTime,
      @TimeOfDayConverter() TimeOfDay? taskEndTime,
      String? taskDescription,
      String? id,
      String? taskname});
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
    Object? taskCategory = freezed,
    Object? taskPriority = freezed,
    Object? taskDate = freezed,
    Object? isCompleted = freezed,
    Object? taskStartTime = freezed,
    Object? taskEndTime = freezed,
    Object? taskDescription = freezed,
    Object? id = freezed,
    Object? taskname = freezed,
  }) {
    return _then(_value.copyWith(
      taskCategory: freezed == taskCategory
          ? _value.taskCategory
          : taskCategory // ignore: cast_nullable_to_non_nullable
              as Categoryenum?,
      taskPriority: freezed == taskPriority
          ? _value.taskPriority
          : taskPriority // ignore: cast_nullable_to_non_nullable
              as Priorityenum?,
      taskDate: freezed == taskDate
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      taskStartTime: freezed == taskStartTime
          ? _value.taskStartTime
          : taskStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      taskEndTime: freezed == taskEndTime
          ? _value.taskEndTime
          : taskEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      taskDescription: freezed == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      taskname: freezed == taskname
          ? _value.taskname
          : taskname // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {Categoryenum? taskCategory,
      Priorityenum? taskPriority,
      DateTime? taskDate,
      bool? isCompleted,
      @TimeOfDayConverter() TimeOfDay? taskStartTime,
      @TimeOfDayConverter() TimeOfDay? taskEndTime,
      String? taskDescription,
      String? id,
      String? taskname});
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
    Object? taskCategory = freezed,
    Object? taskPriority = freezed,
    Object? taskDate = freezed,
    Object? isCompleted = freezed,
    Object? taskStartTime = freezed,
    Object? taskEndTime = freezed,
    Object? taskDescription = freezed,
    Object? id = freezed,
    Object? taskname = freezed,
  }) {
    return _then(_$TaskModelImpl(
      taskCategory: freezed == taskCategory
          ? _value.taskCategory
          : taskCategory // ignore: cast_nullable_to_non_nullable
              as Categoryenum?,
      taskPriority: freezed == taskPriority
          ? _value.taskPriority
          : taskPriority // ignore: cast_nullable_to_non_nullable
              as Priorityenum?,
      taskDate: freezed == taskDate
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      taskStartTime: freezed == taskStartTime
          ? _value.taskStartTime
          : taskStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      taskEndTime: freezed == taskEndTime
          ? _value.taskEndTime
          : taskEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      taskDescription: freezed == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      taskname: freezed == taskname
          ? _value.taskname
          : taskname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl implements _TaskModel {
  _$TaskModelImpl(
      {this.taskCategory,
      this.taskPriority,
      this.taskDate,
      this.isCompleted,
      @TimeOfDayConverter() this.taskStartTime,
      @TimeOfDayConverter() this.taskEndTime,
      this.taskDescription,
      this.id,
      this.taskname});

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final Categoryenum? taskCategory;
  @override
  final Priorityenum? taskPriority;
  @override
  final DateTime? taskDate;
  @override
  final bool? isCompleted;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? taskStartTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? taskEndTime;
  @override
  final String? taskDescription;
  @override
  final String? id;
  @override
  final String? taskname;

  @override
  String toString() {
    return 'TaskModel(taskCategory: $taskCategory, taskPriority: $taskPriority, taskDate: $taskDate, isCompleted: $isCompleted, taskStartTime: $taskStartTime, taskEndTime: $taskEndTime, taskDescription: $taskDescription, id: $id, taskname: $taskname)';
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
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.taskStartTime, taskStartTime) ||
                other.taskStartTime == taskStartTime) &&
            (identical(other.taskEndTime, taskEndTime) ||
                other.taskEndTime == taskEndTime) &&
            (identical(other.taskDescription, taskDescription) ||
                other.taskDescription == taskDescription) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskname, taskname) ||
                other.taskname == taskname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      taskCategory,
      taskPriority,
      taskDate,
      isCompleted,
      taskStartTime,
      taskEndTime,
      taskDescription,
      id,
      taskname);

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
      {final Categoryenum? taskCategory,
      final Priorityenum? taskPriority,
      final DateTime? taskDate,
      final bool? isCompleted,
      @TimeOfDayConverter() final TimeOfDay? taskStartTime,
      @TimeOfDayConverter() final TimeOfDay? taskEndTime,
      final String? taskDescription,
      final String? id,
      final String? taskname}) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  Categoryenum? get taskCategory;
  @override
  Priorityenum? get taskPriority;
  @override
  DateTime? get taskDate;
  @override
  bool? get isCompleted;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get taskStartTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get taskEndTime;
  @override
  String? get taskDescription;
  @override
  String? get id;
  @override
  String? get taskname;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
