import 'package:flutter/material.dart';

import '../../app/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  void Function()? onTap;
  String text;
  ButtonWidget({super.key,required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(5),
        backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
        foregroundColor: WidgetStatePropertyAll(AppColors.whaitColor),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 55)),
      ),
      child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}
