// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRegisterModel _$UserRegisterModelFromJson(Map<String, dynamic> json) {
  return _UserRegisterModel.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterModel {
  String get username => throw _privateConstructorUsedError; // Not nullable
  String get password => throw _privateConstructorUsedError; // Not nullable
  String get email => throw _privateConstructorUsedError; // Not nullable
  String get phoneNumber => throw _privateConstructorUsedError; // Not nullable
  String get address => throw _privateConstructorUsedError;

  /// Serializes this UserRegisterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRegisterModelCopyWith<UserRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterModelCopyWith<$Res> {
  factory $UserRegisterModelCopyWith(
          UserRegisterModel value, $Res Function(UserRegisterModel) then) =
      _$UserRegisterModelCopyWithImpl<$Res, UserRegisterModel>;
  @useResult
  $Res call(
      {String username,
      String password,
      String email,
      String phoneNumber,
      String address});
}

/// @nodoc
class _$UserRegisterModelCopyWithImpl<$Res, $Val extends UserRegisterModel>
    implements $UserRegisterModelCopyWith<$Res> {
  _$UserRegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegisterModelImplCopyWith<$Res>
    implements $UserRegisterModelCopyWith<$Res> {
  factory _$$UserRegisterModelImplCopyWith(_$UserRegisterModelImpl value,
          $Res Function(_$UserRegisterModelImpl) then) =
      __$$UserRegisterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String password,
      String email,
      String phoneNumber,
      String address});
}

/// @nodoc
class __$$UserRegisterModelImplCopyWithImpl<$Res>
    extends _$UserRegisterModelCopyWithImpl<$Res, _$UserRegisterModelImpl>
    implements _$$UserRegisterModelImplCopyWith<$Res> {
  __$$UserRegisterModelImplCopyWithImpl(_$UserRegisterModelImpl _value,
      $Res Function(_$UserRegisterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
  }) {
    return _then(_$UserRegisterModelImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegisterModelImpl implements _UserRegisterModel {
  const _$UserRegisterModelImpl(
      {required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber,
      required this.address});

  factory _$UserRegisterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegisterModelImplFromJson(json);

  @override
  final String username;
// Not nullable
  @override
  final String password;
// Not nullable
  @override
  final String email;
// Not nullable
  @override
  final String phoneNumber;
// Not nullable
  @override
  final String address;

  @override
  String toString() {
    return 'UserRegisterModel(username: $username, password: $password, email: $email, phoneNumber: $phoneNumber, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterModelImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, password, email, phoneNumber, address);

  /// Create a copy of UserRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterModelImplCopyWith<_$UserRegisterModelImpl> get copyWith =>
      __$$UserRegisterModelImplCopyWithImpl<_$UserRegisterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegisterModelImplToJson(
      this,
    );
  }
}

abstract class _UserRegisterModel implements UserRegisterModel {
  const factory _UserRegisterModel(
      {required final String username,
      required final String password,
      required final String email,
      required final String phoneNumber,
      required final String address}) = _$UserRegisterModelImpl;

  factory _UserRegisterModel.fromJson(Map<String, dynamic> json) =
      _$UserRegisterModelImpl.fromJson;

  @override
  String get username; // Not nullable
  @override
  String get password; // Not nullable
  @override
  String get email; // Not nullable
  @override
  String get phoneNumber; // Not nullable
  @override
  String get address;

  /// Create a copy of UserRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRegisterModelImplCopyWith<_$UserRegisterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
