import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/colors.dart';
import 'package:b_store/app/constants/routes.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class FinalBoardingRoute extends StatefulWidget {
  const FinalBoardingRoute({super.key});

  @override
  State<FinalBoardingRoute> createState() => _FinalBoardingRouteState();
}

class _FinalBoardingRouteState extends State<FinalBoardingRoute> {
  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                local.finalBoardingTitle,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titleColor,
                ),
              ),
              SizedBox(height: 16),
              Text(
                local.finalBoardingSubTitle,
                style: TextStyle(fontSize: 16, color: AppColors.subTitleColor),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32),

              Image(
                image: AssetImage(AppAssets.outBoarding4),
                height: 370,
                width: 370,
              ),

              SizedBox(height: 48),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                        shadowColor: AppColors.primaryColor,
                    ),
                    child: Text(
                      local.login,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(width: 24),

                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.register);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.subTitleColor),
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,

                    ),
                    child: Text(
                      local.register,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
