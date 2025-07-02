import 'package:b_store/app/constants/routes.dart';
import 'package:b_store/domain/widgets/my_widgets.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/assets.dart';
import '../../../app/constants/colors.dart';

class ProfileRoute extends StatefulWidget {
  const ProfileRoute({super.key});

  @override
  State<ProfileRoute> createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyWidgets.buildAppBar(
        context,
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.editProfile),
            child: MyWidgets.buildIcon(icon: AppAssets.iconEdite),
          ),
          SizedBox(width: 20),
        ],
        backgroundColor: AppColors.backgroundImages,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // صورة الملف الشخصي والاسم
            profileIconAndEditButton(),
            SizedBox(height: 20),
            // القائمة
            buildListView(context),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget profileIconAndEditButton() {
    return Container(
      color: AppColors.backgroundImages,
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage(AppAssets.profileImage),
          ),
          SizedBox(height: 15),
          Text(
            'Mohammed Khalid',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ],
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    final List<String> icons = [
      AppAssets.iconNotifcation,
      AppAssets.iconMyOrder,
      AppAssets.iconAddress,
      AppAssets.iconPayment,
      AppAssets.iconFavoriteFillBottomNav,
      AppAssets.iconSetting,
    ];

    final List<String> titles = [
      'Notifications',
      'My Orders',
      'Address',
      'Payment',
      'Favourites',
      'Settings',
    ];

    // قائمة الشاشات المرتبطة بكل عنصر
    final List<String> screens = [
      // NotificationsScreen(),
      // MyOrdersScreen(),
      // AddressScreen(),
      // PaymentScreen(),
      // FavouritesScreen(),
      // SettingScreen(),
    ];
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: titles.length,
      separatorBuilder:
          (_, __) => Divider(
            height: 20,
            color: AppColors.primaryColor,
            indent: 30,
            endIndent: 30,
            thickness: 0.5,
          ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            leading: MyWidgets.buildIcon(icon: icons[index]),
            title: Text(
              titles[index],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            trailing: MyWidgets.buildIcon(icon: AppAssets.iconForward),
            onTap: () {
              Navigator.pushNamed(context, screens[index]);
            },
          ),
        );
      },
    );
  }
}
