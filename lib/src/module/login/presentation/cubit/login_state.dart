part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;  
  const factory LoginState.error(String message) = _Error;
  const factory LoginState.failure(Failure failure) = _Failure;
  const factory LoginState.success({
    @Default([]) List<UserLoginModel> userLogin,
    @Default(false) bool? isRemember,
  }) = _Success;
}
