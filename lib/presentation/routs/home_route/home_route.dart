import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/colors.dart';
import 'package:b_store/presentation/routs/cart_route/cart_route.dart';
import 'package:b_store/presentation/routs/favorite_route/favorite_route.dart';
import 'package:b_store/presentation/routs/home_route/product_item_details_model.dart';
import 'package:b_store/presentation/routs/home_route/recent_add_section.dart';
import 'package:b_store/presentation/routs/profile_route/profile_route.dart';
import 'package:flutter/material.dart';

import 'home_categories_section.dart';
import 'most_selling_section.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int _currentIndex = 0;
  final List<Widget> _routes =[
    MainRoute(),
    CartRoute(),
    FavoriteRoute(),
    ProfileRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar(),
      body: SafeArea(
        child: _routes[_currentIndex],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex,
      // يمكن تغيره لاحقاً حسب التنقل
      onTap: (index) {
        // هنا تضع منطق التنقل إن أحببت
        print('Tapped on $index');
          setState(() {
            _currentIndex = index;
          });
      },
      items: [
        BottomNavigationBarItem(icon:SizedBox(width: 25,height: 25,child: Image.asset(AppAssets.iconHome),), label: 'Home', activeIcon: SizedBox(width: 25,height: 25,child: Image.asset(AppAssets.iconHomeFill),)),
        BottomNavigationBarItem(
          icon: SizedBox(width: 25,height: 25,child: Image.asset(AppAssets.iconCart),),
          label: 'Cart',
          activeIcon: SizedBox(width: 25,height: 25,child: Image.asset(AppAssets.iconCartFill),)
        ),
        BottomNavigationBarItem(
          icon: SizedBox(width: 25,height: 25,child: Image.asset(AppAssets.iconFavoriteBottomNav),),
          label: 'Favorites',
          activeIcon: SizedBox(width: 25,height: 25,child: Image.asset(AppAssets.iconFavoriteFillBottomNav),)
        ),
        BottomNavigationBarItem(
          icon: SizedBox(width: 25,height: 25,child: Image.asset(AppAssets.iconProfile),),
          label: 'Profile',
          activeIcon: SizedBox(width: 25,height: 25,child: Image.asset(AppAssets.iconProfileFill),)
        ),
      ],
    );
  }
}

List<ProductItemDetailsModel> getData() {
  List<ProductItemDetailsModel> popularArrayList = [];
  ProductItemDetailsModel item1 = ProductItemDetailsModel();
  item1.img =
      'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item3.jpg';
  item1.name = "Black Jacket";

  ProductItemDetailsModel item2 = ProductItemDetailsModel();
  item2.img =
      'data:image/jpeg;base64,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';
  item2.name = "Dettol";

  ProductItemDetailsModel item3 = ProductItemDetailsModel();
  item3.img =
      'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item5.jpg';
  item3.name = "Blazer";

  ProductItemDetailsModel item4 = ProductItemDetailsModel();
  item4.img =
      'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item2.jpg';
  item4.name = "T-shirt";

  ProductItemDetailsModel item5 = ProductItemDetailsModel();
  item5.img =
      'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item4.jpg';
  item5.name = "Sunglasses";

  ProductItemDetailsModel item6 = ProductItemDetailsModel();
  item6.img =
      'images/widgets/materialWidgets/mwInformationDisplayWidgets/gridview/ic_item7.jpg';
  item6.name = "Shirt";

  popularArrayList.add(item1);
  popularArrayList.add(item2);
  popularArrayList.add(item3);
  popularArrayList.add(item4);
  popularArrayList.add(item5);
  popularArrayList.add(item6);

  return popularArrayList;
}

class MainRoute extends StatefulWidget {
  const MainRoute({super.key});

  @override
  State<MainRoute> createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          HomeCategoriesSection(),
          MostSellingSection(),
          RecentAddSection(),
        ],
      ),
    );
  }
}
