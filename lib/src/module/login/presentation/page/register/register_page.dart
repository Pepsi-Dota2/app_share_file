import 'package:app_share_file/generated/locale_keys.g.dart';
import 'package:app_share_file/src/core/config/di/config_dependencies.dart';
import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:app_share_file/src/core/constant/constant.dart';
import 'package:app_share_file/src/core/router/routers.gr.dart';
import 'package:app_share_file/src/core/widgets/custom_button_submit.dart';
import 'package:app_share_file/src/core/widgets/custom_drop_down_search.dart';
import 'package:app_share_file/src/core/widgets/custom_form_builder.dart';
import 'package:app_share_file/src/module/login/presentation/cubit/login_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

@RoutePage()
class RegisterPage extends StatelessWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final usernameController = TextEditingController();
    final pwdController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormBuilder(
                      name: 'username',
                      hintText: 'username',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilder(
                      name: 'email',
                      hintText: 'email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilder(
                      name: 'phone',
                      hintText: 'phone',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: phoneController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilder(
                      name: 'password',
                      hintText: 'password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: pwdController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilder(
                      name: 'confirmPassword',
                      hintText: 'confirm password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: pwdController,
                    ),
                    const SizedBox(height: 16),
                    CustomSearchableDropdown(
                      initialValue: VillageHelper.getVillageItems().first,
                      items: VillageHelper.getVillageItems(),
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    CustomButtonSubmit(
                      label: LocaleKeys.login_sign_in.tr(),
                      onPressed: () {
                        if (_formKey.currentState!.validate() != false) {
                          final username = usernameController.text.trim();
                          final pwd = pwdController.text.trim();
                          // context.read<LoginCubit>().login(username, pwd);
                        }
                      },
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
                                    context.router.replaceAll([LoginRoute()]);
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
        );
      },
    );
  }
}
