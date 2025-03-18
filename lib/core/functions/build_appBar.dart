import 'package:flutter/material.dart';

import '../app_colors.dart';

PreferredSizeWidget buildCustomAppBar(BuildContext context, String title,{bool isBackButton = true}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: AppColors.kPrimaryColor,
    leading: isBackButton ? IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ):Container(),
  );
}
