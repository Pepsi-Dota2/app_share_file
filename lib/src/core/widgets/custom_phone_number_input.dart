import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  const CustomPhoneNumberInput({
    super.key,
    required this.controller,
    this.labelText,
    this.validator,
    this.initialValue,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        controller.text = number.phoneNumber ?? '';
      },
      initialValue: PhoneNumber(isoCode: 'LA', phoneNumber: initialValue),
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        showFlags: true,
      ),
      inputDecoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.grey,
        ),
      ),
      validator: validator,
    );
  }
}
