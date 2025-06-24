import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/colors.dart';
import 'package:b_store/app/constants/routes.dart';
import 'package:b_store/presentation/routs/out_boarding_route/out_boarding_route_model.dart';
import 'package:b_store/presentation/routs/out_boarding_route/out_boarding_widget.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class OutBoardingRoute extends StatefulWidget {
  const OutBoardingRoute({super.key});

  @override
  State<OutBoardingRoute> createState() => _OutBoardingRouteState();
}

class _OutBoardingRouteState extends State<OutBoardingRoute> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Widget _buildDotIndicator(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 20,
      height: 5,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color:
            _currentPage == index
                ? AppColors.primaryColor
                : AppColors.subTitleColor,
      ),
    );
  }

  Widget _buildStartButton() {
    final locale = S.of(context);
    return _currentPage == 2
        ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('Go To Next Page');
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.finalBoarding,
                        );
                      },
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.buttonColor,
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          AppColors.whaitColor,
                        ),
                      ),
                      child: Text(locale.start_button),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        )
        : SizedBox(height: 70);
  }

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final List<OutBoardingRouteModel> pages = [
      OutBoardingRouteModel(
        title: local.outBoardingTitle1,
        description: local.outBoardingSubtitle1,
        image: AppAssets.outBoarding1,
      ),
      OutBoardingRouteModel(
        title: local.outBoardingTitle2,
        description: local.outBoardingSubtitle2,
        image: AppAssets.outBoarding2,
      ),
      OutBoardingRouteModel(
        title: local.outBoardingTitle3,
        description: local.outBoardingSubtitle3,
        image: AppAssets.outBoarding3,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              onPressed:
                  _currentPage == 2
                      ? null
                      : () => _pageController.jumpToPage(pages.length - 1),
              child: Text(
                local.skip,
                style: TextStyle(
                  color:
                      _currentPage == 2
                          ? AppColors.subTitleColor
                          : AppColors.primaryColor,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OutBoardingWidget(model: pages[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => _buildDotIndicator(index),
              ),
            ),
            SizedBox(height: 20),
            _buildStartButton(),
          ],
        ),
      ),
    );
  }
}
