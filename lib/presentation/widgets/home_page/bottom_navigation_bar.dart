import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_assets.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/presentation/pages/qr_page.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/select_cart.dart';
import 'package:malina_online_shop/presentation/pages/main_page.dart';

class MainPageBottomNavigationBar extends StatefulWidget {
  const MainPageBottomNavigationBar({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  _MainPageBottomNavigationBarState createState() =>
      _MainPageBottomNavigationBarState();
}

class _MainPageBottomNavigationBarState
    extends State<MainPageBottomNavigationBar> {
  late int _selectedIndex;
  OverlayEntry? _overlayEntry;
  final List<Widget> _pages = [
    const MainPage(),
    Container(), // Placeholder for "Избранное"
    const QrPage(),
    Container(), // Placeholder for "Профиль"
    Container(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    if (index == 4) {
      _toggleCartSelectionMenu(context);
    } else {
      _removeOverlay();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _pages[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_sharp),
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
      selectedFontSize: 10,
      unselectedFontSize: 10,
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
        right: 12,
        bottom: 120,
        
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
