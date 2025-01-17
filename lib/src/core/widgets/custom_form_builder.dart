import 'package:app_share_file/src/core/constant/colors/app_color.dart';
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
    this.obscureText = false, required this.controller,
  });

  final String name;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? 'Enter $name',
         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), 
          borderSide: BorderSide.none, 
        ),
        filled: true,
        fillColor: AppColors.backgroundWhite,
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
      obscureText: obscureText,
      initialValue: initialValue,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
    );
  }
}