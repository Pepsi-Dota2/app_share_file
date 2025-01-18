import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/module/login/datasource/data/local_datasource/user_login_local.dart';
import 'package:app_share_file/src/module/login/datasource/data/remote_datasource/user_login_remote.dart';
import 'package:app_share_file/src/module/login/domain/model/user_login_model.dart';
import 'package:app_share_file/src/module/login/domain/repository/user_login_repository.dart';
import 'package:app_share_file/src/module/login/domain/usecase/user_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserLoginRepository)
class UserLoginRepositoryImpl implements UserLoginRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  UserLoginRepositoryImpl(this._localDataSource,
      {required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, UserLoginModel>> login(LoginParams params) async {
    final response = await _remoteDataSource.login(params);
    return response.fold(
      (failure) => Left(failure),
      (res) async {
        await _localDataSource.saveUser(username: params.username, password: params.password);
        return Right(res);
      },
    );
  }
}
