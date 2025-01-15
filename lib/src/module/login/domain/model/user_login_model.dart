import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_model.freezed.dart';
part 'user_login_model.g.dart';

@freezed
class UserLoginModel with _$UserLoginModel {
  const factory UserLoginModel({
    @Default("") String name,
    @Default("") String password,
  }) = _UserLoginModel;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);
}
