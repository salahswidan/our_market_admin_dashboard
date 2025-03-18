import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.onPressed, this.controller,
  });
  final void Function()? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        
          labelText: 'Search In Market',
          suffixIcon: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
              foregroundColor: AppColors.kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: onPressed,
            label: Icon(Icons.search),
          ),
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
