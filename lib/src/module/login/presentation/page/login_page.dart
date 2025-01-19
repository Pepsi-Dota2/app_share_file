import 'dart:ui';

import 'package:app_share_file/generated/locale_keys.g.dart';
import 'package:app_share_file/src/core/config/di/config_dependencies.dart';
import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:app_share_file/src/core/constant/image_path.dart';
import 'package:app_share_file/src/core/router/routers.dart';
import 'package:app_share_file/src/core/router/routers.gr.dart';
import 'package:app_share_file/src/core/utils/bottom_sheet.dart';
import 'package:app_share_file/src/core/widgets/custom_button_submit.dart';
import 'package:app_share_file/src/core/widgets/custom_form_builder.dart';
import 'package:app_share_file/src/core/widgets/custom_form_file_password.dart';
import 'package:app_share_file/src/core/widgets/custom_icon_button.dart';
import 'package:app_share_file/src/core/widgets/error_dialog.dart';
import 'package:app_share_file/src/core/widgets/language_button.dart';
import 'package:app_share_file/src/core/widgets/loading_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../cubit/login_cubit.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: this,
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final usernameController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (userLogin, _, register) {
            LoadingDialog.hideLoadingDialog(context);
            getIt<AppRouter>().replaceAll([IntroduceRoute()]);
          },
          error: (message) {
            ErrorDialog.showErrorDialog(
              context: context,
              message: message,
            );
          },
          orElse: () => () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              LanguageButtonWidget(
                locale: context.locale,
                onPressed: () {
                  showLanguageBottomSheet(
                    context,
                    (locale) => {context.setLocale(locale)},
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          isDarkMode
                              ? AppColors.backgroundWhite
                              : AppColors.grabageColor,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset("assets/images/logo_terracycle.png"),
                      ),
                      CustomFormBuilder(
                        name: 'username',
                        hintText: LocaleKeys.login_username_hint.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.login_password_validation.tr();
                          }
                          return null;
                        },
                        controller: usernameController,
                      ),
                      const SizedBox(height: 16),
                       CustomFormBuilderPassword(
                        name: 'password',
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        obscureText: true, // Enable password visibility toggle
                        controller: pwdController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //       value: state.maybeMap(
                      //         success: (successState) =>successState.isRemember,
                      //         orElse: () => false,
                      //       ),
                      //       onChanged: (value) {
                      //         cubit.isRememberme(value ?? false);
                      //       },
                      //     ),
                      //     Text(LocaleKeys.login_remember_me.tr()),
                      //     const Spacer(),
                      //     Text(LocaleKeys.login_forgot_password.tr())
                      //   ],
                      // ),
                      const SizedBox(height: 50),
                      CustomButtonSubmit(
                        label: LocaleKeys.login_sign_in.tr(),
                        onPressed: () {
                          if (_formKey.currentState!.validate() != false) {
                            final username = usernameController.text.trim();
                            final pwd = pwdController.text.trim();
                            context.read<LoginCubit>().login(username, pwd);
                          }
                        },
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            imageSvg: AppImagePath.iconGoogle,
                          ),
                          const SizedBox(width: 25),
                          CustomIconButton(
                            imageSvg: AppImagePath.iconFacebook,
                          ),
                          const SizedBox(width: 25),
                          CustomIconButton(
                            imageSvg: AppImagePath.iconGithub,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: LocaleKeys.login_no_account.tr(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: ' ${LocaleKeys.login_sign_up.tr()}',
                                  style: TextStyle(
                                    color: AppColors.grabageColor,
                                    fontSize: 18,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.router.push(RegisterRoute());
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
