import 'package:flutter/material.dart';

import '../../../helpers/common_widgets.dart';
import '../../../helpers/size_box.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extentions.dart';
import '../model/food_category_model.dart';

class FoodCategoryWidget extends StatelessWidget {
  final FoodCategoryModel foodCategoryModel;
  const FoodCategoryWidget({
    super.key,
    required this.foodCategoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.width * 20,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppConstants.appWhiteColor,
        border: Border.all(
          color: AppConstants.appGreyColor.withOpacity(.2),
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            child: Icon(
              foodCategoryModel.icon,
              color: AppConstants.appSecondaryColor,
              size: 24,
            ),
          ),
          const SizeBoxH(5),
          CommonTextWidget(
            text: foodCategoryModel.name ?? "",
            color: AppConstants.appRedLightColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
