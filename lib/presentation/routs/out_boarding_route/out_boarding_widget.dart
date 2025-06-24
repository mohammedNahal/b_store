import 'package:b_store/presentation/routs/out_boarding_route/out_boarding_route_model.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/colors.dart';

class OutBoardingWidget extends StatelessWidget {
  final OutBoardingRouteModel model;

  const OutBoardingWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(model.image, height: 300,),
        const SizedBox(height: 40),
        Text(
          model.title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.titleColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          model.description,
          style: TextStyle(fontSize: 16, color: AppColors.subTitleColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
