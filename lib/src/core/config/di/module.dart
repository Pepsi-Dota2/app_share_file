import 'package:app_share_file/src/core/constant/api_path/api_path.dart';
import 'package:app_share_file/src/core/router/routers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  AppRouter get router => AppRouter();

  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.options.baseUrl = AppApiPath.baseUrl;
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.connectTimeout = const Duration(seconds: 30 * 1);
    dio.options.receiveTimeout = const Duration(seconds: 30 * 1);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final FlutterSecureStorage _storage = FlutterSecureStorage();
        // Retrieve token securely if required
        final String? token = await _storage.read(key: 'Token');
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        // Log request details
        print('Request: ${options.method} ${options.path}');
        print('Token: $token');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Log response details
        print('Response: ${response.statusCode}');
        print('Response Data: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // Log error details
        print('Error: ${e.message}');
        print('Error Response: ${e.response?.data}');
        return handler.next(e);
      },
    ));

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ));
    }
    return dio;
  }

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
