import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFormBuilder extends StatelessWidget {
  const CustomFormBuilder({
    super.key,
    required this.name,
    this.labelText,
    this.hintText,
    this.validator,
    this.initialValue,
    this.obscureText = false,
  });

  final String name;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: labelText ?? name,
        hintText: hintText ?? 'Enter $name',
      ),
      obscureText: obscureText,
      initialValue: initialValue,
      validator: validator,
    );
  }
}
