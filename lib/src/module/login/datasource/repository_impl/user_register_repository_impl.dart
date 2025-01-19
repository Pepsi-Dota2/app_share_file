

import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/module/login/datasource/data/remote_datasource/user_login_remote.dart';
import 'package:app_share_file/src/module/login/domain/model/user_register_model.dart';
import 'package:app_share_file/src/module/login/domain/repository/user_register_repository.dart';
import 'package:app_share_file/src/module/login/domain/usecase/user_register_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRegisterRepository)
class UserRegisterRepositoryImpl implements UserRegisterRepository {
  final RemoteDataSource _remoteDataSource;

  UserRegisterRepositoryImpl({required RemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, UserRegisterModel>> register(RegisterParams userRegister) async{
    final response = await _remoteDataSource.register(userRegister);
    return response.fold(
      (failure) => Left(failure),
      (res) {
        return Right(res);}
    );
  }
}