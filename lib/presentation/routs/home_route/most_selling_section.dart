import 'package:b_store/presentation/routs/home_route/product_item.dart';
import 'package:b_store/presentation/routs/home_route/product_item_details_model.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/colors.dart';
import '../../../generated/l10n.dart';
import 'home_route.dart';

class MostSellingSection extends StatefulWidget {
  const MostSellingSection({super.key});

  @override
  State<MostSellingSection> createState() => _MostSellingSectionState();
}

class _MostSellingSectionState extends State<MostSellingSection> {
  late List<ProductItemDetailsModel> mListing;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    mListing = getData();
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 30,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                local.mostSelling,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                local.viewAll,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),

        // قائمة المنتجات
        SizedBox(
          height: height / 2.7,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: mListing.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, __) => SizedBox(width: 5),
            itemBuilder: (context, index) {
              return Product(mListing[index], index);
            },
          ),
        ),
      ],
    );
  }
}