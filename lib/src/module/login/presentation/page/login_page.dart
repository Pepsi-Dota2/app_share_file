import 'package:app_share_file/src/core/widgets/custom_button_submit.dart';
import 'package:app_share_file/src/core/widgets/custom_form_builder.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              CustomFormBuilder(
                name: 'username',
                labelText: 'Username',
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
              CustomButtonSubmit(
                label: 'SignIn',
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
            ],
          ),
        ),
      ),
    );
  }
}
