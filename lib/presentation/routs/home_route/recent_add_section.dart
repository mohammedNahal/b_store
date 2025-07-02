import 'package:b_store/presentation/routs/home_route/product_item.dart';
import 'package:b_store/presentation/routs/home_route/product_item_details_model.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/colors.dart';
import '../../../generated/l10n.dart';
import 'home_route.dart';

class RecentAddSection extends StatefulWidget {
  const RecentAddSection({super.key});

  @override
  State<RecentAddSection> createState() => _RecentAddSectionState();
}

class _RecentAddSectionState extends State<RecentAddSection> {
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Added',
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
          height: height / 2.5,
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