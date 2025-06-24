import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ForgetPasswordRoute extends StatefulWidget {

  const ForgetPasswordRoute({super.key});

  @override
  State<ForgetPasswordRoute> createState() => _ForgetPasswordRouteState();
}

class _ForgetPasswordRouteState extends State<ForgetPasswordRoute> {
  final TextEditingController _emailOrPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Image.asset(AppAssets.iconBack, width: 25, height: 25,),
                    SizedBox(width:10),
                    Text(
                      local.back,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              // Title
              Text(
                local.recoveryTitle,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  height: 1.5,
                ),
              ),
              SizedBox(height: height/7),
              // Input Field
              TextFormField(
                controller: _emailOrPhoneController,
                decoration: InputDecoration(
                  hintText: local.emailOrPhone,
                  hintStyle: TextStyle(color: AppColors.subTitleColor),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.focusedBorderColor),
                  ),
                ),
              ),
              SizedBox(height: 32),
              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle next
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    local.next,
                    style: TextStyle(
                      color: AppColors.whaitColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
