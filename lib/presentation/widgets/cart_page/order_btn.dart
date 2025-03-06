import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';

class OrderButton extends StatelessWidget {
  final int totalPrice;
  final VoidCallback onOrder;

  const OrderButton(
      {super.key, required this.totalPrice, required this.onOrder});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onOrder,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.selectedItem,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(double.infinity, 56),
      ),
      child: Row(
        children: [
          const Text("Заказать ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const Spacer(),
          Text("$totalPrice ",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const Text("С",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
