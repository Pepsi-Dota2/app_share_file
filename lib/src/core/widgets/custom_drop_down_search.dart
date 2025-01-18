import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomSearchableDropdown extends StatelessWidget {
  const CustomSearchableDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.labelText,
    this.hintText,
    this.dialogTitle,
    this.validator,
    this.initialValue,
    this.titleBackgroundColor = Colors.deepPurple,
    this.titleTextColor = Colors.white70,
    this.dialogBorderRadius = 25,
  });

  final List<String> items;
  final void Function(String?) onChanged;
  final String? labelText;
  final String? hintText;
  final String? dialogTitle;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final Color titleBackgroundColor;
  final Color titleTextColor;
  final double dialogBorderRadius;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: (a, b) => items,
      validator: validator,
      onChanged: onChanged,
      selectedItem: initialValue,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.backgroundWhite,
        ),
      ),
      popupProps: PopupProps.dialog(
        title: dialogTitle != null
            ? Container(
                decoration: BoxDecoration(color: titleBackgroundColor),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  dialogTitle!,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: titleTextColor,
                  ),
                ),
              )
            : null,
        dialogProps: DialogProps(
          clipBehavior: Clip.antiAlias,
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(dialogBorderRadius),
          ),
        ),
      ),
    );
  }
}
