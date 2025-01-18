import 'package:app_share_file/src/core/config/observe.dart';
import 'package:app_share_file/src/module/login/datasource/data/local_datasource/user_login_local.dart';
import 'package:app_share_file/src/module/login/domain/usecase/user_login_usecase.dart';
import 'package:app_share_file/src/module/login/presentation/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/widgets.dart';

import 'config_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  getIt.registerFactory<LoginCubit>(() => LoginCubit(
        getIt<UserLoginUseCase>(),
      ));
  return getIt.init();
}
