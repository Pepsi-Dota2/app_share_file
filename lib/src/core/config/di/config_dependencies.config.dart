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
import 'package:dio/dio.dart' as _i361;
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
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i554.AppApi>(() => _i554.AppApi(gh<_i361.Dio>()));
    return this;
  }
}

class _$InjectableModule extends _i714.InjectableModule {}
