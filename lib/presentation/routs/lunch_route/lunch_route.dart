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
      Navigator.pushReplacementNamed(context, '/next_route');
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
