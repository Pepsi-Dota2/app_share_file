import 'package:app_share_file/src/core/constant/api_path/api_path.dart';
import 'package:app_share_file/src/module/login/domain/model/user_login_model.dart';
import 'package:app_share_file/src/module/login/domain/usecase/user_login_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'app_api.g.dart';

@lazySingleton
@RestApi()
abstract class AppApi {
  @factoryMethod
  factory AppApi(Dio dio) = _AppApi;

  @POST(AppApiPath.login)
  Future<UserLoginModel> login(@Body() LoginParams userLogin);
}
