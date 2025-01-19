import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/module/login/domain/model/user_register_model.dart';
import 'package:app_share_file/src/module/login/domain/repository/user_register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/use_case.dart';

part 'user_register_usecase.freezed.dart';
part 'user_register_usecase.g.dart';

@lazySingleton
class UserRegisterUseCase extends UseCase<UserRegisterModel, RegisterParams> {
  final UserRegisterRepository _repository;

  UserRegisterUseCase(this._repository);

  @override
  Future<Either<Failure, UserRegisterModel>> call(RegisterParams params) {
    return _repository.register(params);
  }
}

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
     @Default("") String username,
     @Default("") String password,
     @Default("") String phoneNumber,
     @Default("") String email,
     @Default("") String address,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
