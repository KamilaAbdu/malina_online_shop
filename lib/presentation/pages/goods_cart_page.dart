import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_assets.dart';
import 'package:malina_online_shop/presentation/pages/main_page.dart';
import 'package:malina_online_shop/presentation/widgets/cart_page/cart_item_card.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/bottom_navigation_bar.dart';


class GoodsCartPage extends StatefulWidget {
  const GoodsCartPage({super.key});

  @override
  _GoodsCartPageState createState() => _GoodsCartPageState();
}

class _GoodsCartPageState extends State<GoodsCartPage> {
  String selectedTab = "Доставка";
  List<CartItem> cartItems = [
    CartItem(
      title: 'Hair',
      name: "Hadat Cosmetics",
      description: "Шампунь интенсивно восстанавливающий \nHydro Intensive Repair Shampoo 250 мл",
      price: 1900,
      imagePath: AppAssets.hairShampoo,
    ),
    CartItem(
      title: 'Hair',
      name: "Hadat Cosmetics",
      description: "Увлажняющий кондиционер \n150 мл",
      price: 2000,
      imagePath: AppAssets.hairConditioner,
    ),
    CartItem(
      title: 'Preen Beauty',
      name: "L'Oreal Paris Elseve",
      description: "Шампунь для ослабленных волос",
      price: 600,
      imagePath: AppAssets.hairShampooElseve,
    ),
  ];

  void clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainPageBottomNavigationBar(currentIndex: 4),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          ),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
        ),
        title: Text(
          'Корзина',
          style: AppTextStyle.s20w700.copyWith(color: AppColors.cartName),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: clearCart,
            child: Text(
              'Очистить',
              style: AppTextStyle.s14w400.copyWith(color: AppColors.cartName),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: _buildTabButton("Доставка"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: _buildTabButton("В заведении"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: cartItems.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        item: cartItems[index],
                        onRemove: () => setState(() {
                          cartItems.removeAt(index);
                        }),
                      );
                    },
                  )
                : const Center(child: Text("Ваша корзина пуста")),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedTab = title;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              selectedTab == title ? AppColors.selectedItem : Colors.grey[200],
          foregroundColor: selectedTab == title ? Colors.white : Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(title, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

