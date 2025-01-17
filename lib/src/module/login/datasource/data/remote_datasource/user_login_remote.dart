import 'dart:async';
import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/core/service/app_api.dart';
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

  var logger = Logger();
  @override
  Future<Either<Failure, UserLoginModel>> login(LoginParams login) async {
    try {
      final response = await _appApi.login(login);
      logger.i("Successful response: $response");
      return Right(response);
    } on DioException catch (e) {
      logger.e(
          "Dio error: ${e.message ?? 'Unknown error'}, Status: ${e.response?.statusCode}");

      // Check status code from DioException
      if (e.response?.statusCode == 404) {
        return Left(UserNotFoundFailure('User not found'));
      }

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return Left(ServerFailure('Connection timed out'));
        case DioExceptionType.connectionError:
          if (e.message?.contains('Connection refused') ?? false) {
            return Left(ServerFailure(
                'Server is not reachable. Please check if the server is running.'));
          }
          return Left(ServerFailure('No internet connection'));
        case DioExceptionType.badResponse:
          final statusCode = e.response?.statusCode;
          switch (statusCode) {
            case 404:
              return Left(UserNotFoundFailure('User not found'));
            case 401:
              return Left(ServerFailure('Invalid credentials'));
            default:
              return Left(ServerFailure('Server error: $statusCode'));
          }
        default:
          return Left(
              ServerFailure('An unexpected error occurred: ${e.message}'));
      }
    } catch (e) {
      logger.e("General error: ${e.toString()}");
      return Left(
          ServerFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
