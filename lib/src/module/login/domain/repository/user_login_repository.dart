import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/module/login/domain/model/user_login_model.dart';
import 'package:app_share_file/src/module/login/domain/usecase/user_login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class UserLoginRepository {
  Future<Either<Failure , UserLoginModel>> login(LoginParams params);
}