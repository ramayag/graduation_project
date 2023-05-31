import 'package:gui/core/utils/app_strings.dart';
import 'package:gui/core/utils/color_manager.dart';
import 'package:gui/core/utils/constants.dart';
import 'package:gui/presentation/rating/components/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:gui/core/utils/app_strings.dart';
import 'package:gui/core/utils/color_manager.dart';
import 'package:gui/core/utils/constants.dart';
import 'package:gui/presentation/rating/components/rating_row.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.rating,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorsManager.darkTeal),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RatingRow(title: AppStrings.soundRating),
              const RatingRow(title: AppStrings.bodyLanguageRating),
              Constants.verticalSpaceMedium(),
              const Divider(),
              const RatingRow(title: AppStrings.totalRating),
            ],
          ),
        ),
      ),
    );
  }
}
