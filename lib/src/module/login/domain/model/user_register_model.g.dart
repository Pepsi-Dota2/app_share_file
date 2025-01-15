// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegisterModelImpl _$$UserRegisterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegisterModelImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$UserRegisterModelImplToJson(
        _$UserRegisterModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
    };
