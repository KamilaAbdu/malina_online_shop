import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';

class SelectCartBackCircle extends StatelessWidget {
  final IconData icon;
  final String text;

  const SelectCartBackCircle({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: AppColors.selectCartBackCircle,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: AppColors.selectCartItems, 
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: AppTextStyle.s10w400.copyWith(color: AppColors.selectCartItems),
          ),
        ],
      ),
    );
  }
}