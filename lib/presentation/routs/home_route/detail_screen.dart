import 'package:b_store/domain/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/assets.dart';
import '../../../app/constants/colors.dart';
import '../../../generated/l10n.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({this.name, this.image});

  final String? name;
  final String? image;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var text =
      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''';

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Image.asset(AppAssets.iconBack, width: 25, height: 25),
                    SizedBox(width: 10),
                    Text(
                      local.back,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        print('Favorite');
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.rectangleColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Image.asset(
                          AppAssets.iconFavoriteFill,
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Hero(
                        tag: widget.image!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          child: Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            color: AppColors.backgroundImages,
                          ),
                          // Image.asset(
                          //   widget.image!,
                          //   fit: BoxFit.cover,
                          //   height: 400,
                          //   width: MediaQuery.of(context).size.width,
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name!,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: AppColors.titleColor,
                            ),
                            maxLines: 3,
                          ),
                          Text(
                            '\$80',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: AppColors.titleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.primaryColor,
                      height: 5,
                      thickness: 1.5,
                      endIndent: 25,
                      indent: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.priceColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: ButtonWidget(onTap: (){}, text: 'Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
