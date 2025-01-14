

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/widgets.dart';

import 'config_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  return getIt.init();
}