import 'package:flutter/material.dart';

import '../../../app/constants/assets.dart';
import '../../../app/constants/colors.dart';
import '../../../generated/l10n.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final List<String> categories = [
      local.vegetablesAndFruitsCategories,
      local.meatCategories,
      local.cheeseCategories,
      local.snacksCategories,
      local.rationingMaterialsCategories,
      local.detergentCategories,
      local.drinkCategories,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and Search icon
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                local.homeTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 22,
                height: 22,
                child: Image.asset(AppAssets.iconSearch),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        // Horizontal list of categories
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height / 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => SizedBox(width: 15),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('Go to Categories page number${index + 1}');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.rectangleColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.rectangleBoarderColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor,
                          blurRadius: 0.1,
                          spreadRadius: 0.1,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}