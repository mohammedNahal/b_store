import 'package:b_store/app/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  bool showPassword;
  final Widget? prefixIcon;
  final String? label;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  bool valid;
  Widget? suffixIcon;
  void Function(String)? onChange;
  final String? hint;

  TextFormFieldWidget({
    super.key,
    required this.controller,
    this.showPassword = false,
    this.prefixIcon,
    this.label,
    this.focusedBorderColor,
    this.borderColor,
    this.errorBorderColor,
    this.valid = false,
    this.suffixIcon,
    this.onChange,
    this.hint
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: showPassword,
      onChanged: onChange ?? (value) {},
      style: TextStyle(color: AppColors.blackColor, fontSize: 16),
      cursorColor: AppColors.primaryColor,
      cursorWidth: 3,
      cursorHeight: 18,
      cursorOpacityAnimates: true,
      cursorRadius: Radius.circular(50),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        labelText: label,
        hintText: hint ?? '',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: prefixIcon
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: focusedBorderColor ?? AppColors.primaryColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.subTitleColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: errorBorderColor ?? AppColors.discountColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color:
                valid
                    ? focusedBorderColor ?? AppColors.primaryColor
                    : errorBorderColor ?? AppColors.discountColor,
            width: 1,
          ),
        ),
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
    );
  }
}
