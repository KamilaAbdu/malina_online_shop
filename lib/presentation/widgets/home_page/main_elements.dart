import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_dimens.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';

class MainElements extends StatelessWidget {
  const MainElements({
    super.key,
    required this.title,
    required this.contentText, required this.isFood, required this.image, required this.elementColor,
  });

  final String title;
  final String contentText;
  final bool isFood;
  final String image;
  final Color elementColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.mainPageElementHeight,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: elementColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDimens.mainPageBorderRadius),
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 15.0,
            child: Text(
              title,
              style: AppTextStyle.s22w600.copyWith(color: Colors.black),
            ),),
            Positioned(
            left: 20.0,
            top: 50.0,
            width: 200,
            child: Text(
              contentText,
              style: AppTextStyle.s16w500.copyWith(color: Colors.black),
            ),
          ),
           Positioned(
            right: -20,
            bottom: -20,
            child: Image.asset(
              image,
              
            ),
          ),
        ],
      ),
    );
  }
}