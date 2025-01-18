// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_share_file/src/core/config/di/module.dart' as _i714;
import 'package:app_share_file/src/core/router/routers.dart' as _i1013;
import 'package:app_share_file/src/core/service/app_api.dart' as _i554;
import 'package:app_share_file/src/module/login/datasource/data/local_datasource/user_login_local.dart'
    as _i704;
import 'package:app_share_file/src/module/login/datasource/data/remote_datasource/user_login_remote.dart'
    as _i186;
import 'package:app_share_file/src/module/login/datasource/repository_impl/user_login_repository_impl.dart'
    as _i466;
import 'package:app_share_file/src/module/login/domain/repository/user_login_repository.dart'
    as _i775;
import 'package:app_share_file/src/module/login/domain/usecase/user_login_usecase.dart'
    as _i417;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i1013.AppRouter>(() => injectableModule.router);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => injectableModule.secureStorage);
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i704.LocalDataSource>(() => _i704.UserLoginLocal());
    gh.lazySingleton<_i554.AppApi>(() => _i554.AppApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i186.RemoteDataSource>(
        () => _i186.UserLoginRemote(gh<_i554.AppApi>()));
    gh.lazySingleton<_i775.UserLoginRepository>(
        () => _i466.UserLoginRepositoryImpl(
              gh<_i704.LocalDataSource>(),
              remoteDataSource: gh<_i186.RemoteDataSource>(),
            ));
    gh.lazySingleton<_i417.UserLoginUseCase>(
        () => _i417.UserLoginUseCase(gh<_i775.UserLoginRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i714.InjectableModule {}
