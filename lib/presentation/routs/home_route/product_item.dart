import 'package:b_store/presentation/routs/home_route/product_item_details_model.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/assets.dart';
import '../../../app/constants/colors.dart';
import '../../../generated/l10n.dart';
import 'detail_screen.dart';

class Product extends StatelessWidget {
  late ProductItemDetailsModel model;

  Product(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder:
                (BuildContext context) =>
                DetailScreen(name: model.name, image: model.img),
          ),
        );
      },
      child: Container(
        width: width / 2.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Stack(
              children: [
                // صورة المنتج أو الخلفية
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: height / 5,
                    width: double.infinity,
                    child: Image.network(model.img),

                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () {
                      print('Set Favorite');
                    },
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(AppAssets.iconFavorite),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            // اسم المنتج
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                model.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    overflow: TextOverflow.ellipsis
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 2),
            // وصف المنتج
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Fresh and quality meat every day.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: AppColors.titleColor,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 8),
            // السعر
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    '\$80',
                    style: TextStyle(color: AppColors.priceColor,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '\$100',
                    style: TextStyle(
                      color: AppColors.discountColor,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.discountColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            // Spacer(),
            // // زر الإضافة
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: IconButton(
            //     icon: Icon(
            //       Icons.add_circle_outline,
            //       color: Colors.blue,
            //     ),
            //     onPressed: () {
            //       print('Added ${product['name']} to cart');
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}