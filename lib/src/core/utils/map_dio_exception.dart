import 'package:app_share_file/src/core/error/failure.dart';
import 'package:dio/dio.dart';

class MapDioException {
  Failure mapDioExceptionToFailure(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ServerFailure('Connection timed out');
    case DioExceptionType.connectionError:
      if (e.message?.contains('Connection refused') ?? false) {
        return ServerFailure(
            'Server is not reachable. Please check if the server is running.');
      }
      return ServerFailure('No internet connection');
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        return ServerFailure('Invalid credentials');
      }
      return ServerFailure('Server error: ${statusCode ?? 'Unknown status code'}');
    default:
      return ServerFailure('An unexpected error occurred: ${e.message}');
  }
}
}