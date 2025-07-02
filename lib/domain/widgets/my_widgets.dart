import 'package:flutter/material.dart';

import '../../app/constants/assets.dart';
import '../../app/constants/colors.dart';

class MyWidgets {
  static PreferredSizeWidget buildAppBar(
    BuildContext context, {
    List<Widget>? actions,
    Color? backgroundColor,
  }) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.whaitColor,
      title: Text(
        'Back',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
      titleSpacing: 0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Image.asset(AppAssets.iconBack),
      ),
      actions: actions,
    );
  }

  static Widget buildIcon({required String icon}) {
    return SizedBox(width: 25, height: 25, child: Image.asset(icon));
  }
}
