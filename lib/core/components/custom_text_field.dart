import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.lableText,
    this.isPassword = false,
    this.onPressed,
    this.onChanged, this.inputFormatters,
  });
  final TextEditingController? controller;
  final String lableText;
  final bool isPassword;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return "This field can't be empty";
        }
        return null;
      },
      obscureText: isPassword,
      cursorColor: AppColors.kBordersideColor,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.remove_red_eye_outlined))
              : null,
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
