import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_assets.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';
import 'package:malina_online_shop/presentation/widgets/cart_page/order_btn.dart';

class CartItem {
  final String name;
  final String title;
  final String description;
  final int price;
  final String imagePath;
  int quantity;

  CartItem({
    required this.name,
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });
}

class CartItemCard extends StatefulWidget {
  final CartItem item;
  final VoidCallback onRemove;

  const CartItemCard({super.key, required this.item, required this.onRemove});

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  void increment() {
    setState(() {
      widget.item.quantity++;
    });
  }

  void decrement() {
    if (widget.item.quantity > 1) {
      setState(() {
        widget.item.quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.cartShadow, width: 2)),
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      shadowColor: AppColors.cartShadow,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.item.title,
                    style: AppTextStyle.s16w600
                        .copyWith(color: AppColors.cartTitle)),
                const SizedBox(width: 2),
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 20,
                  color: AppColors.cartTitle,
                ),
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cartOutline)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Image.asset(widget.item.imagePath, width: 110, height: 110),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(widget.item.name,
                              style: AppTextStyle.s16w500
                                  .copyWith(color: AppColors.cartName)),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                  "${widget.item.price * widget.item.quantity} ",
                                  style: AppTextStyle.s16w500
                                      .copyWith(color: AppColors.cartName)),
                              const SizedBox(width: 2),
                              Text(
                                'C',
                                style: AppTextStyle.s16w500.copyWith(
                                  color: AppColors.cartName,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                      Text(widget.item.description,
                          softWrap: true,
                          style: AppTextStyle.s12w400
                              .copyWith(color: AppColors.cartDescription)),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                                color: AppColors.softGreyBlue,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                              child: GestureDetector(
                                child: IconButton(
                                    icon: const Icon(
                                      Icons.remove,
                                      color: AppColors.cartName,
                                      size: 18,
                                    ),
                                    onPressed: decrement),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Text("${widget.item.quantity}",
                              style: AppTextStyle.s18w500.copyWith(color: AppColors.cartName)),
                          const SizedBox(width: 14),
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                                color: AppColors.softGreyBlue,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                              child: GestureDetector(
                                child: IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      color: AppColors.cartName,
                                      size: 18,
                                    ),
                                    onPressed: increment),
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              icon: Image.asset(
                                AppAssets.deleteIcon,
                                width: 34,
                                height: 34,
                              ),
                              onPressed: widget.onRemove),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.softGreyBlue,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                      size: 30,
                      opticalSize: 1.5,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Добавки",
                      style: AppTextStyle.s16w500
                          .copyWith(color: AppColors.cartTitle),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            OrderButton(
              totalPrice: widget.item.price * widget.item.quantity,
              onOrder: () {},
            ),
          ],
        ),
      ),
    );
  }
}
