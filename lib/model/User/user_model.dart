// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_model.freezed.dart';
// part 'user_model.g.dart';

// @freezed
// class UserModel with _$UserModel {
//   const factory UserModel({
//     String? id,
//     String? email,
//     String? username,
//     String? password,
//   }) = _UserModel;

//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       _$UserModelFromJson(json); // Corrected method name
// }
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    String? id,
    String? email,
    String? username,
    String? password,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
