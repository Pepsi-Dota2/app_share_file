import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@lazySingleton
@RestApi()
abstract class AppApi {
  @factoryMethod
  factory AppApi(Dio dio) = _AppApi;
}
