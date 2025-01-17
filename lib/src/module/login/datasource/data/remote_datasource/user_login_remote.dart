import 'dart:async';
import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/core/service/app_api.dart';
import 'package:app_share_file/src/core/utils/logger.dart';
import 'package:app_share_file/src/core/utils/map_dio_exception.dart';
import 'package:app_share_file/src/module/login/domain/model/user_login_model.dart';
import 'package:app_share_file/src/module/login/domain/usecase/user_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, UserLoginModel>> login(LoginParams login);
}

@LazySingleton(as: RemoteDataSource)
class UserLoginRemote implements RemoteDataSource {
  final AppApi _appApi;

  UserLoginRemote(this._appApi);

  @override
  Future<Either<Failure, UserLoginModel>> login(LoginParams login) async {
    try {
      final response = await _appApi.login(login);
      LoggerService.info("Successful response: $response");
      return Right(response);
    } on DioException catch (e) {
      LoggerService.error("Dio error: ${e.message ?? 'Unknown error'}, Status: ${e.response?.statusCode}",e, e.stackTrace);

      if (e.response?.statusCode == 404) {
        return Left(UserNotFoundFailure('User not found'));
      }

      return Left(MapDioException().mapDioExceptionToFailure(e));
    } catch (e) {
      LoggerService.error("General error: ${e.toString()}", e);
      return Left(ServerFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
