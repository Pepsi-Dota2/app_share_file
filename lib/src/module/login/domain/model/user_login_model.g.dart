// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLoginModelImpl _$$UserLoginModelImplFromJson(Map<String, dynamic> json) =>
    _$UserLoginModelImpl(
      name: json['name'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$$UserLoginModelImplToJson(
        _$UserLoginModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
    };
