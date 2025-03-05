import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:malina_online_shop/data/core/constants/app_assets.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/data/core/constants/app_dimens.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/bottom_navigation_bar.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/horizontal_scrolling_list.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/main_elements.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/qr_scan.dart';
import 'package:malina_online_shop/presentation/widgets/home_page/search_field.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      bottomNavigationBar: const MainPageBottomNavigationBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.mainHorizontalPadding),
          children: [
            const SizedBox(
                height: AppDimens.searchFieldHeight, child: MainSearchField()),
            const SizedBox(height: AppDimens.verticalSmallPadding),
            const QrScan(),
            const SizedBox(height: AppDimens.verticalMediumPadding),
            const MainElements(
              title: 'Еда',
              contentText: 'Из кафе и \nресторанов',
              isFood: true,
              image: AppAssets.foodElement,
              elementColor: AppColors.yellowElement,
            ),
            const SizedBox(height: AppDimens.verticalMediumPadding),
            const MainElements(
              title: 'Бьюти',
              contentText: 'Салоны красоты \nи товары',
              isFood: false,
              image: AppAssets.beautyElement,
              elementColor: AppColors.pinkElement,
            ),
            const SizedBox(height: AppDimens.verticalLargePadding),
            Text('Скоро в Malina',
                style: AppTextStyle.s17w500.copyWith(color: Colors.black)),
            const SizedBox(height: AppDimens.verticalSmallPadding),
            const SizedBox(
              height: 86,
              child: HorizontalScrollingList(
                title: [
                  'Вакансии',
                  'Маркет',
                  'Цветы',
                  'Другое',
                ],
                boxColor: [
                  AppColors.lightBlueBox,
                  AppColors.nudeBox,
                  AppColors.lightPinkBox,
                  AppColors.lightGreenBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}