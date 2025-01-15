import 'dart:ui';

import 'package:app_share_file/generated/locale_keys.g.dart';
import 'package:app_share_file/src/core/config/di/config_dependencies.dart';
import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:app_share_file/src/core/constant/image_path.dart';
import 'package:app_share_file/src/core/utils/bottom_sheet.dart';
import 'package:app_share_file/src/core/widgets/custom_button_submit.dart';
import 'package:app_share_file/src/core/widgets/custom_form_builder.dart';
import 'package:app_share_file/src/core/widgets/custom_icon_button.dart';
import 'package:app_share_file/src/core/widgets/language_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {},
      child: Scaffold(
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
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilder(
                      name: 'password',
                      labelText: LocaleKeys.login_password.tr(),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.login_password_validation.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        Text(LocaleKeys.login_remember_me.tr()),
                        const Spacer(),
                        Text(LocaleKeys.login_forgot_password.tr())
                      ],
                    ),
                    const SizedBox(height: 50),
                    CustomButtonSubmit(
                      label: LocaleKeys.login_sign_in.tr(),
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          final formData = _formKey.currentState?.value;
                          print(formData);
                        } else {
                          print('Form is invalid');
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
                                text: LocaleKeys.login_sign_up.tr(),
                                style: Theme.of(context)
                                    .tabBarTheme
                                    .labelStyle
                                    ?.copyWith(
                                      color: AppColors.grabageColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
