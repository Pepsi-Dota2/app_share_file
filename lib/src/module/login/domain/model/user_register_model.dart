import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_model.freezed.dart';
part 'user_register_model.g.dart';

@freezed
class UserRegisterModel with _$UserRegisterModel {
  const factory UserRegisterModel({
    required String username,
    required String password,
    required String email,
    required String phoneNumber,
    required String address,
  }) = _UserRegisterModel;

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterModelFromJson(json);
}
