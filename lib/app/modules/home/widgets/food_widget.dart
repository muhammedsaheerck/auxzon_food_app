import 'package:flutter/material.dart';

import '../../../helpers/common_widgets.dart';
import '../../../helpers/size_box.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extentions.dart';
import '../model/food_model.dart';

class FoodWidget extends StatelessWidget {
  final FoodModel foodModel;
  const FoodWidget({
    super.key,
    required this.foodModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      borderOnForeground: true,
      shadowColor: AppConstants.appGreyColor.withOpacity(.5),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppConstants.appWhiteColor,
            borderRadius: BorderRadius.circular(15)),
        width: Responsive.width * 43,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: Responsive.width * 39,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppConstants.appGreyColor.withOpacity(.12),
                      image:
                          DecorationImage(image: AssetImage(foodModel.image))),
                ),
                Container(
                  height: 22,
                  margin: const EdgeInsets.all(8),
                  width: 60,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: AppConstants.appWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: AppConstants.appYellowColor,
                      ),
                      const SizeBoxV(5),
                      CommonTextWidget(
                          text: "(${foodModel.rating})",
                          fontWeight: FontWeight.bold,
                          color: AppConstants.appSecondaryColor,
                          fontSize: 11),
                    ],
                  ),
                )
              ],
            ),
            const SizeBoxH(10),
            CommonTextWidget(
                text: foodModel.name,
                fontWeight: FontWeight.bold,
                color: AppConstants.appSecondaryColor,
                overFlow: TextOverflow.ellipsis,
                fontSize: 14),
            const SizeBoxH(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget(
                    text: foodModel.description,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.appGreyColor.withOpacity(.5),
                    fontSize: 12),
                CommonTextWidget(
                    text: "\$${foodModel.price}",
                    fontWeight: FontWeight.bold,
                    color: AppConstants.appSecondaryColor,
                    fontSize: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
