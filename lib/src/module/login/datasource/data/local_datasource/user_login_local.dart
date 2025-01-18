import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
    Future<void> saveUser({required String username, required String password});
  Future<String> getUser();
  Future<void> deleteUser();
}

@LazySingleton(as: LocalDataSource)
class UserLoginLocal implements LocalDataSource {
  FlutterSecureStorage _storage = FlutterSecureStorage();

  @override 
  Future<void> saveUser({required String username, required String password}) async {
    await _storage.write(key: 'username', value: username);
    await _storage.write(key: 'password', value: password);
  }

  @override
  Future<String> getUser() async {
    return await _storage.read(key: 'uid') ?? '';
  }

  @override
  Future<void> deleteUser() async {
    await _storage.delete(key: 'uid');
  }
}
