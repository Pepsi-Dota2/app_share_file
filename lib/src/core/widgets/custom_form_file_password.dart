import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFormBuilderPassword extends StatefulWidget {
  const CustomFormBuilderPassword({
    super.key,
    required this.name,
    this.labelText,
    this.hintText,
    this.validator,
    this.initialValue,
    this.obscureText = false,
    required this.controller,
  });

  final String name;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final TextEditingController controller;

  @override
  State<CustomFormBuilderPassword> createState() => _CustomFormBuilderPasswordState();
}

class _CustomFormBuilderPasswordState extends State<CustomFormBuilderPassword> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Enter ${widget.name}',
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
        // Add suffix icon for password visibility toggle
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
      obscureText: widget.obscureText && !_isPasswordVisible,
      initialValue: widget.initialValue,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
    );
  }
}