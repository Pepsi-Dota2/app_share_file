import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:flutter/material.dart';

class CustomButtonSubmit extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButtonSubmit({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.grabageColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), 
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          shadowColor: Colors.green.withOpacity(0.5), 
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
