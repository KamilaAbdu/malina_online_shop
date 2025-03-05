import 'package:flutter/material.dart';
import 'package:malina_online_shop/data/core/constants/app_dimens.dart';
import 'package:malina_online_shop/data/core/constants/app_text_styles.dart';

class HorizontalScrollingList extends StatelessWidget {
  const HorizontalScrollingList(
      {super.key, required this.title, required this.boxColor});

  final List<String> title;
  final List<Color> boxColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          width: 86,
          decoration: BoxDecoration(
            color: boxColor[index],
            borderRadius: const BorderRadius.all(
                Radius.circular(AppDimens.mainPageBorderRadius)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title[index],
                style: AppTextStyle.s12w400,
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 10,
        );
      },
    );
  }
}