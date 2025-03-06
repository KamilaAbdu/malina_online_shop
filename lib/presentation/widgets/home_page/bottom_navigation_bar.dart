import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_assets.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/presentation/pages/qr_page.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/select_cart.dart';

class MainPageBottomNavigationBar extends StatefulWidget {
  const MainPageBottomNavigationBar({super.key});

  @override
  _MainPageBottomNavigationBarState createState() =>
      _MainPageBottomNavigationBarState();
}

class _MainPageBottomNavigationBarState
    extends State<MainPageBottomNavigationBar> {
  int _selectedIndex = 0;
  OverlayEntry? _overlayEntry;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QrPage()),
      );
    } else if (index == 4) {
     
      _toggleCartSelectionMenu(context);
    } else {
      _removeOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Лента',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Избранное',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.qrBottomNavBarIcon),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Профиль',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Корзина',
        ),
      ],
      selectedItemColor: AppColors.selectedItem,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
    );
  }

  void _toggleCartSelectionMenu(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry(context);
      Overlay.of(context)?.insert(_overlayEntry!);
    } else {
      _removeOverlay();
    }
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        right: 14,
        bottom: 56,
        child: SelectCart(
          onClose: _removeOverlay,
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}