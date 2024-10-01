import 'package:auxzonfood/app/modules/product%20details/controller/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/common_widgets.dart';
import '../../../helpers/size_box.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extentions.dart';
import '../../home/model/food_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Selector<ProductDetailsProvider, List<FoodModel>>(
          selector: (p0, p1) => p1.cartItems,
          builder: (context, cartItems, child) => ListView.separated(
              itemBuilder: (context, index) {
                FoodModel foodModel = cartItems[index];
                return CartProductWidget(foodModel: foodModel);
              },
              separatorBuilder: (context, index) => const SizeBoxH(8),
              itemCount: cartItems.length),
        ),
      ),
    );
  }
}

class CartProductWidget extends StatelessWidget {
  final FoodModel foodModel;
  const CartProductWidget({
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
        child: Row(
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
              ],
            ),
            const SizeBoxV(10),
            SizedBox(
              width: Responsive.width * 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                      text: foodModel.name,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.appSecondaryColor,
                      overFlow: TextOverflow.ellipsis,
                      fontSize: 16),
                  const SizeBoxH(5),
                  CommonTextWidget(
                      text: foodModel.description,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.appGreyColor.withOpacity(.5),
                      fontSize: 14),
                  const SizeBoxH(5),
                  CommonTextWidget(
                      text: "\$${foodModel.price}",
                      fontWeight: FontWeight.bold,
                      color: AppConstants.appSecondaryColor,
                      fontSize: 22),
                  const SizeBoxH(5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: AppConstants.appYellowColor,
                      ),
                      const SizeBoxV(5),
                      CommonTextWidget(
                          text: "(${foodModel.rating})",
                          fontWeight: FontWeight.bold,
                          color: AppConstants.appSecondaryColor,
                          fontSize: 14),
                    ],
                  ),
                  const SizeBoxH(5),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(Responsive.width * 29, 35),
                        backgroundColor: AppConstants.appRedLightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Remove",
                        style: TextStyle(
                          fontSize: Responsive.text * 1.5,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.appWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
