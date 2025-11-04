import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const LoginButtonWidget({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        foregroundColor: AppColors.whiteColor,
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        padding: const EdgeInsets.symmetric(vertical: 10),
        textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),

      onPressed: onPress,
      child: Text(title),
    );
  }
}
