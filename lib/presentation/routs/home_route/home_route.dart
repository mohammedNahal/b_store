import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // يمكن تغيره لاحقاً حسب التنقل
        onTap: (index) {
          // هنا تضع منطق التنقل إن أحببت
          print('Tapped on $index');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HomeCategoriesSection(), // ✅ أول جزء من الواجهة
              MostSellingSection(),
              RecentAddSection(),
            ],
          ),
        ),
      ),
    );
  }
}

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
          height: MediaQuery.of(context).size.height / 15,
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

class MostSellingSection extends StatelessWidget {
  const MostSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // // بيانات تجريبية مؤقتة
    // final List<Map<String, dynamic>> products = [
    //   {
    //     'name': 'Detole',
    //     'price': 120,
    //     'image': 'https://via.placeholder.com/120', // استخدم صورة مناسبة لاحقاً
    //   },
    //   {
    //     'name': 'Leather Strap',
    //     'price': 75,
    //     'image': 'https://via.placeholder.com/120',
    //   },
    //   {
    //     'name': 'Gold Bracelet',
    //     'price': 240,
    //     'image': 'https://via.placeholder.com/120',
    //   },
    // ];

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
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, __) => SizedBox(width: 5),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  print('Item ${index+1}');
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
                              color: AppColors.backgroundImages,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: InkWell(
                              onTap: (){
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
                          'Meat',
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
                              style: TextStyle(color: AppColors.priceColor),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '\$100',
                              style: TextStyle(
                                color: AppColors.discountColor,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.discountColor,
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
            },
          ),
        ),
      ],
    );
  }
}

class RecentAddSection extends StatelessWidget {
  const RecentAddSection({super.key});

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // // بيانات تجريبية مؤقتة
    // final List<Map<String, dynamic>> products = [
    //   {
    //     'name': 'Detole',
    //     'price': 120,
    //     'image': 'https://via.placeholder.com/120', // استخدم صورة مناسبة لاحقاً
    //   },
    //   {
    //     'name': 'Leather Strap',
    //     'price': 75,
    //     'image': 'https://via.placeholder.com/120',
    //   },
    //   {
    //     'name': 'Gold Bracelet',
    //     'price': 240,
    //     'image': 'https://via.placeholder.com/120',
    //   },
    // ];

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
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, __) => SizedBox(width: 5),
            itemBuilder: (context, index) {
              return Container(
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
                            color: AppColors.backgroundImages,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset(AppAssets.iconFavorite),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // اسم المنتج
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Meat',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
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
                            style: TextStyle(color: AppColors.priceColor),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '\$100',
                            style: TextStyle(
                              color: AppColors.discountColor,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.discountColor,
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
              );
            },
          ),
        ),
      ],
    );
  }
}
