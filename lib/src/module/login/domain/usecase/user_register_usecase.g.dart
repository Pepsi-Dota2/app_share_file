// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterParamsImpl _$$RegisterParamsImplFromJson(Map<String, dynamic> json) =>
    _$RegisterParamsImpl(
      username: json['username'] as String? ?? "",
      password: json['password'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      email: json['email'] as String? ?? "",
      address: json['address'] as String? ?? "",
    );

Map<String, dynamic> _$$RegisterParamsImplToJson(
        _$RegisterParamsImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
    };
