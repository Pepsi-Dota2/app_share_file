
import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/core/usecase/use_case.dart';
import 'package:app_share_file/src/module/login/domain/model/user_login_model.dart';
import 'package:app_share_file/src/module/login/domain/repository/user_login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_login_usecase.freezed.dart';
part 'user_login_usecase.g.dart';

@lazySingleton
class UserLoginUseCase extends UseCase<UserLoginModel, LoginParams> {
  final UserLoginRepository _repository;

  UserLoginUseCase(this._repository);

  @override
  Future<Either<Failure, UserLoginModel>> call(LoginParams params) {
    return _repository.login(params);
  }
  
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({@Default("") String username, @Default("") String password}) = _LoginParams;
  factory LoginParams.fromJson(Map<String, dynamic> json) => _$LoginParamsFromJson(json);
}
