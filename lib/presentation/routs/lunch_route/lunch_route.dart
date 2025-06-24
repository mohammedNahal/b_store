import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/routes.dart';
import 'package:flutter/material.dart';


class LunchRoute extends StatefulWidget {
  const LunchRoute({super.key});

  @override
  State<LunchRoute> createState() => _LunchRouteState();
}


class _LunchRouteState extends State<LunchRoute> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacementNamed(context, AppRoutes.outBoarding);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.logo),
      ),
    );
  }
}
