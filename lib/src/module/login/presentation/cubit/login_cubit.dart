import 'dart:ui';

import 'package:app_share_file/generated/locale_keys.g.dart';
import 'package:app_share_file/src/core/error/failure.dart';
import 'package:app_share_file/src/module/login/domain/model/user_login_model.dart';
import 'package:app_share_file/src/module/login/domain/usecase/user_login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._userLoginUseCase) : super(LoginState.initial());
  final UserLoginUseCase _userLoginUseCase;

  void isRememberme(bool isRemember) {
    emit(LoginState.success(isRemember: isRemember));
  }

  Future<void> login( String username, String password) async {
    try {
      emit(LoginState.loading());

      final params = LoginParams(username: username, password: password);
      final result = await _userLoginUseCase.call(params);

      result.fold(
        (failure) {
          if (failure is UserNotFoundFailure) {
            emit(
                LoginState.error(LocaleKeys.error_user_not_found_message.tr()));
          } else if (failure is ServerFailure) {
            emit(LoginState.error(failure.message));
          } else {
            emit(LoginState.error(LocaleKeys.error_server_error.tr()));
          }
        },
        (data) => emit(LoginState.success(userLogin: [data])),
      );
    } catch (e) {
      emit(LoginState.error(LocaleKeys.error_server_error.tr()));
    }
  }
}
