import 'package:auxzonfood/app/helpers/common_widgets.dart';
import 'package:auxzonfood/app/modules/home/model/food_model.dart';
import 'package:auxzonfood/app/modules/product%20details/controller/product_details_provider.dart';
import 'package:auxzonfood/app/utils/app_constants.dart';
import 'package:auxzonfood/app/utils/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../helpers/size_box.dart';
import '../../../utils/app_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  final FoodModel foodModel;
  const ProductDetailsScreen({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          context.read<ProductDetailsProvider>().productCountForCheckout = 1;
        }
      },
      child: Scaffold(
        backgroundColor: AppConstants.appWhiteColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizeBoxH(Responsive.height * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        Routes.back(context: context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppConstants.appRedLightColor.withOpacity(.05),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: AppConstants.appPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppConstants.appRedLightColor.withOpacity(.05),
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.ellipsis,
                          size: 20,
                          color: AppConstants.appPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: Responsive.height * 45,
                  width: Responsive.width * 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(foodModel.image)),
                  ),
                ),
                // SizeBoxH(Responsive.height * 1.5),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 42,
                    width: Responsive.width * 26,
                    decoration: BoxDecoration(
                        color: AppConstants.appPrimaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<ProductDetailsProvider>()
                                .removeCountForCart();
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                            color: AppConstants.appWhiteColor,
                          ),
                        ),
                        SizeBoxV(Responsive.width * 3),
                        Selector<ProductDetailsProvider, int>(
                          selector: (p0, p1) => p1.productCountForCheckout,
                          builder: (context, productCountForCheckout, child) =>
                              CommonTextWidget(
                            color: AppConstants.appWhiteColor,
                            text: "$productCountForCheckout",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizeBoxV(Responsive.width * 3),
                        InkWell(
                          onTap: () {
                            context
                                .read<ProductDetailsProvider>()
                                .addCountForCart();
                          },
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: AppConstants.appWhiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizeBoxH(Responsive.height * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Responsive.width * 70,
                      child: CommonTextWidget(
                        align: TextAlign.start,
                        color: AppConstants.appSecondaryColor,
                        text: foodModel.name,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Row(
                      children: [
                        const CommonTextWidget(
                          color: AppConstants.appPrimaryColor,
                          text: "\$ ",
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                        CommonTextWidget(
                          color: AppConstants.appSecondaryColor,
                          text: foodModel.price,
                          fontSize: Responsive.text * 2.4,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ],
                ),
                SizeBoxH(Responsive.height * .1),
                CommonTextWidget(
                  align: TextAlign.start,
                  color: AppConstants.appSecondaryColor,
                  text: foodModel.description,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizeBoxH(Responsive.height * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          const SizeBoxV(8),
                          const Icon(Icons.star,
                              color: AppConstants.appGreyColor, size: 25),
                          const SizeBoxV(5),
                          CommonTextWidget(
                              color: AppConstants.appGreyColor,
                              text: foodModel.rating,
                              fontSize: 16),
                        ],
                      ),
                    ),
                    const SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.whatshot_sharp,
                              color: AppConstants.appGreyColor, size: 25),
                          SizeBoxV(5),
                          CommonTextWidget(
                              color: AppConstants.appGreyColor,
                              text: "150 Kcal",
                              fontSize: 16),
                        ],
                      ),
                    ),
                    const SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.watch_later_outlined,
                              color: AppConstants.appGreyColor, size: 25),
                          SizeBoxV(5),
                          CommonTextWidget(
                              color: AppConstants.appGreyColor,
                              text: "5-10 Min",
                              fontSize: 16),
                          SizeBoxV(20)
                        ],
                      ),
                    ),
                  ],
                ),
                SizeBoxH(Responsive.height * 4),
                const ReadMoreText(
                  """is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimCollapsedText: 'Read More',
                  trimExpandedText: 'Show less',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.appPrimaryColor),
                ),
                SizeBoxH(Responsive.height * 4),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProductDetailsProvider>()
                          .addToCart(foodModel, context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(Responsive.width * 80, 50),
                      backgroundColor: AppConstants.appPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          fontSize: Responsive.text * 2,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizeBoxH(8)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
