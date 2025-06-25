import 'package:b_store/app/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  bool showPassword;
  final String prefixIcon;
  final String label;
  final Color focusedBorderColor;
  final Color borderColor;
  final Color errorBorderColor;
  bool valid;
  Widget? suffixIcon;
  void Function(String)? onChange;

  TextFormFieldWidget({
    super.key,
    required this.controller,
    this.showPassword = false,
    required this.prefixIcon,
    required this.label,
    required this.focusedBorderColor,
    required this.borderColor,
    required this.errorBorderColor,
    this.valid = false,
    this.suffixIcon,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: showPassword,
      onChanged: onChange ?? (value) {},
      style:  TextStyle(
        color: AppColors.blackColor,
        fontSize: 16,
      ),
      cursorColor: AppColors.primaryColor,
      cursorWidth: 3,
      cursorHeight: 18,
      cursorOpacityAnimates: true,
      cursorRadius: Radius.circular(50),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            prefixIcon,
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: focusedBorderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: errorBorderColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: valid ? focusedBorderColor : errorBorderColor,
            width: 1,
          ),
        ),
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
    );

  }
}
