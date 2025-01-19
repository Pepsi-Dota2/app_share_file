import 'package:app_share_file/generated/locale_keys.g.dart';
import 'package:app_share_file/src/core/config/di/config_dependencies.dart';
import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:app_share_file/src/core/constant/constant.dart';
import 'package:app_share_file/src/core/router/routers.dart';
import 'package:app_share_file/src/core/router/routers.gr.dart';
import 'package:app_share_file/src/core/widgets/custom_button_submit.dart';
import 'package:app_share_file/src/core/widgets/custom_drop_down_search.dart';
import 'package:app_share_file/src/core/widgets/custom_form_builder.dart';
import 'package:app_share_file/src/core/widgets/custom_form_file_password.dart';
import 'package:app_share_file/src/core/widgets/custom_phone_number_input.dart';
import 'package:app_share_file/src/core/widgets/error_dialog.dart';
import 'package:app_share_file/src/core/widgets/loading_dialog.dart';
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
    final pwdConfirmController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (userLogin, _, register) {
            LoadingDialog.hideLoadingDialog(context);
            getIt<AppRouter>().replaceAll([IntroduceRoute()]);
          },
          orElse: () => () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Create Account"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormBuilder(
                      name: 'username',
                      hintText: LocaleKeys.login_username_hint.tr(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.login_username_validation.tr();
                        }
                        return null;
                      },
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilder(
                      name: 'email',
                      hintText: LocaleKeys.login_email_hint.tr(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.login_email_validation.tr();
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilderPassword(
                      name: 'password',
                      obscureText: true, // Enable password visibility toggle
                      hintText: LocaleKeys.login_password_hint.tr(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.login_password_validation.tr();
                        }
                        return null;
                      },
                      controller: pwdController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilderPassword(
                      name: 'confirmPassword',
                      obscureText: true, // Enable password visibility toggle
                      hintText: LocaleKeys.login_confirm_password_hint.tr(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.login_confirm_password_validation
                              .tr();
                        }
                        return null;
                      },
                      controller: pwdConfirmController,
                    ),
                    const SizedBox(height: 16),
                    CustomPhoneNumberInput(
                      controller: phoneController,
                      labelText: 'Phone Number',
                      initialValue: '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomSearchableDropdown(
                      controller: addressController, // Pass the controller
                      initialValue: VillageHelper.getVillageItems().first,
                      items: VillageHelper.getVillageItems(),
                      hintText: "Enter your village",
                      onChanged: (value) {
                        addressController.text = value ?? '';
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a village';
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
                          if (pwd != pwdConfirmController.text.trim()) {
                            ErrorDialog.showErrorDialog(
                              context: context,
                              message: LocaleKeys
                                  .login_confirm_password_validation
                                  .tr(),
                            );
                            return;
                          }
                          final email = emailController.text.trim();
                          final phone = phoneController.text.trim();
                          final village = addressController.text.trim();
                          context
                              .read<LoginCubit>()
                              .register(username, pwd, email, phone, village);
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: LocaleKeys.login_already_have_account.tr(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: ' ${LocaleKeys.login_sign_in.tr()}',
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
