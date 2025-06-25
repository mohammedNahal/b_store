import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/colors.dart';
import 'package:b_store/app/constants/locals.dart';
import 'package:b_store/app/constants/routes.dart';
import 'package:b_store/presentation/routs/final_boarding_route/final_boarding_route.dart';
import 'package:b_store/presentation/routs/forget_password_route/forget_password_route.dart';
import 'package:b_store/presentation/routs/home_route/home_route.dart';
import 'package:b_store/presentation/routs/login_route/sign_in_route.dart';
import 'package:b_store/presentation/routs/lunch_route/lunch_route.dart';
import 'package:b_store/presentation/routs/out_boarding_route/out_boarding_route.dart';
import 'package:b_store/presentation/routs/register_route/sign_up_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppAssets.fontFamily,
        scaffoldBackgroundColor: AppColors.whaitColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.whaitColor,
          elevation: 3,
        ),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // supportedLocales: ,
      locale: Locale(AppLocales.englishLocale),

      initialRoute: AppRoutes.lunch,
      routes: {
        AppRoutes.lunch: (context) => LunchRoute(),
        AppRoutes.outBoarding: (context) => OutBoardingRoute(),
        AppRoutes.finalBoarding: (context) => FinalBoardingRoute(),
        AppRoutes.register: (context) => SignUpRoute(),
        AppRoutes.login: (context)=> SignInRoute(),
        AppRoutes.forgetPassword: (context) => ForgetPasswordRoute(),
        AppRoutes.home: (context) => HomeRoute(),
      },
    );
  }
}
