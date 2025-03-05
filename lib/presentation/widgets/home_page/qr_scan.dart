import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_assets.dart';
import 'package:malina_online_shop/data/core/constants/app_colos.dart';
import 'package:malina_online_shop/data/core/constants/app_dimens.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';

class QrScan extends StatelessWidget {
  const QrScan({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: AppDimens.mainPageQrElementHeight,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.qrElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimens.mainPageBorderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.qrScanElement,
                    height: 80.0,
                    width: 80.0,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'Сканируй QR-код и заказывай прямо в заведении',
                      style: AppTextStyle.s16w500.copyWith(color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}