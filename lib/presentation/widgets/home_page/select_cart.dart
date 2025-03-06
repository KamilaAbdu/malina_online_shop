import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_assets.dart';
import 'package:malina_online_shop/data/core/constants/app_dimens.dart';
import 'package:malina_online_shop/presentation/pages/cart_page.dart';
import 'package:malina_online_shop/presentation/pages/food_cart_page.dart';
import 'package:malina_online_shop/presentation/pages/goods_cart_page.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/select_cart_circle.dart';

class SelectCart extends StatelessWidget {
  const SelectCart({super.key, required this.onClose});

final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimens.selectCartBorderRadius)),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: 70,
              height: 164,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4.5, 4.5, 4.5, 8),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                      
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FoodCartPage(),
                          ),
                        );
                        onClose();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            SelectCartBackCircle(
                              icon: Image.asset(AppAssets.foodIcon),
                              text: 'Еда',
                               ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const GoodsCartPage(),
                          ),
                        );
                        onClose();
                      },
                      child: SelectCartBackCircle(
                        icon: Image.asset(AppAssets.cosmeticsIcon),
                        text: 'Товары',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}