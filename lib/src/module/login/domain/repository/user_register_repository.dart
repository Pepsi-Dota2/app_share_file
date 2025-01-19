import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/module/login/domain/model/user_register_model.dart';
import 'package:app_share_file/src/module/login/domain/usecase/user_register_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class UserRegisterRepository {
  Future<Either<Failure, UserRegisterModel>> register(RegisterParams userRegister);
}