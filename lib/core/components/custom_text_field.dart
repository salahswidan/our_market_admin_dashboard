import 'package:flutter/material.dart';
import '../app_colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.controller,
    required this.lableText,  this.isPassword = false, this.onPressed,
  });
  final TextEditingController? controller;
  final String lableText;
  final bool isPassword;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      cursorColor: AppColors.kBordersideColor,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? IconButton(onPressed: onPressed, icon: Icon(Icons.remove_red_eye_outlined)) : null,
          labelText: lableText,
          labelStyle: TextStyle(color: AppColors.kBlackColor),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
