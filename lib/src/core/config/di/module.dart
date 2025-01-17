
import 'package:app_share_file/src/core/constant/api_path/api_path.dart';
import 'package:app_share_file/src/core/router/routers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ));
    }
    return dio;
  }
}
