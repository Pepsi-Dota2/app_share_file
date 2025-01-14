import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:app_share_file/src/core/constant/image_path.dart';
import 'package:app_share_file/src/core/widgets/custom_button_submit.dart';
import 'package:app_share_file/src/core/widgets/custom_form_builder.dart';
import 'package:app_share_file/src/core/widgets/custom_icon_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grabagelight,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset("assets/images/logo_terracycle.png",
                        color: AppColors.backgroundWhite),
                    CustomFormBuilder(
                      name: 'username',
                      hintText: 'Enter your username',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomFormBuilder(
                      name: 'password',
                      labelText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
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
                        Text("Remember me"),
                        const Spacer(),
                        Text("Forgot password?")
                      ],
                    ),
                    const SizedBox(height: 50),
                    CustomButtonSubmit(
                      label: 'Sign In',
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          // Handle successful form submission
                          final formData = _formKey.currentState?.value;
                          print(formData);
                        } else {
                          // Handle form validation failure
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
                                text: "Don't have an account?",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                children: [
                              TextSpan(
                                  text: ' Sign Up',
                                  style: Theme.of(context)
                                      .tabBarTheme
                                      .labelStyle
                                      ?.copyWith(
                                        color: AppColors.grabageColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ))
                            ]))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
