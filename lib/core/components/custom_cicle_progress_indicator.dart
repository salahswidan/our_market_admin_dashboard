import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(color: AppColors.kPrimaryColor));
  }
}
