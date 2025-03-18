import 'package:flutter/material.dart';
import '../app_colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.controller,
    required this.lableText,
  });
  final TextEditingController? controller;
  final String lableText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.kBordersideColor,
      controller: controller,
      decoration: InputDecoration(
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
