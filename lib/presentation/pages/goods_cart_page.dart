import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';

class GoodsCartPage extends StatefulWidget {
  const GoodsCartPage({super.key});

  @override
  _GoodsCartPageState createState() => _GoodsCartPageState();
}

class _GoodsCartPageState extends State<GoodsCartPage> {
  int itemCount = 1;
  double itemPrice = 1900;
  double conditionerPrice = 2000;
  double elsevePrice = 600;

  void incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItem() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

  void clearCart() {
    setState(() {
      itemCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Корзина',
          style: AppTextStyle.s20w700.copyWith(color: AppColors.cartName),
        ),
        actions: [
          TextButton(
            onPressed: clearCart,
            child: Text(
              'Очистить',
              style: AppTextStyle.s14w500.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCartItem('Hair', 'Hadat Cosmetics', itemPrice, 'Шампунь интенсивно восстанавливающий Hydro Intensive Repair Shampoo 250 мл'),
          _buildCartItem('Hair', 'Hadat Cosmetics', conditionerPrice, 'Увлажняющий кондиционер 150 мл'),
          _buildCartItem('Preen Beauty', 'L\'Oreal Paris Elseve', elsevePrice, 'Шампунь для ослабленных волос'),
        ],
      ),
    );
  }

  Widget _buildCartItem(String category, String title, double price, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category, style: AppTextStyle.s16w600),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset("assets/images/sample_product.png", width: 60, height: 60),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTextStyle.s16w500),
                        Text(description, style: AppTextStyle.s14w400),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: decrementItem,
                          ),
                          Text("$itemCount", style: AppTextStyle.s16w500),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: incrementItem,
                          ),
                        ],
                      ),
                      Text("${price * itemCount} С", style: AppTextStyle.s16w600),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: clearCart,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text("Заказать ${price * itemCount} С", style: AppTextStyle.s16w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
