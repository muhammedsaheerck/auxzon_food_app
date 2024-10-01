import 'package:auxzonfood/app/helpers/common_widgets.dart';
import 'package:auxzonfood/app/helpers/size_box.dart';
import 'package:auxzonfood/app/modules/home/controller/home_provider.dart';
import 'package:auxzonfood/app/modules/home/model/food_category_model.dart';
import 'package:auxzonfood/app/utils/app_constants.dart';
import 'package:auxzonfood/app/utils/app_router.dart';
import 'package:auxzonfood/app/utils/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product details/view/product_details_screen.dart';
import '../model/food_model.dart';
import '../widgets/food_category_widget.dart';
import '../widgets/food_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appWhiteColor,
      body: SizedBox(
        height: Responsive.height * 100,
        width: Responsive.width * 100,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: Responsive.height * 38,
                    width: Responsive.width * 100,
                    color: AppConstants.appPrimaryColor,
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16, top: 16),
                          width: Responsive.width * 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizeBoxH(Responsive.height * 4),
                              const CommonTextWidget(
                                  color: AppConstants.appWhiteColor,
                                  fontSize: 16,
                                  text: "Location"),
                              const SizeBoxH(5),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.place_outlined,
                                    size: 18,
                                    color: AppConstants.appWhiteColor,
                                  ),
                                  SizeBoxV(5),
                                  CommonTextWidget(
                                    color: AppConstants.appWhiteColor,
                                    text: "St, Abigael",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizeBoxV(5),
                                  Icon(
                                    CupertinoIcons.chevron_down,
                                    size: 15,
                                    color: AppConstants.appWhiteColor,
                                  ),
                                ],
                              ),
                              const SizeBoxH(35),
                              const CommonTextWidget(
                                color: AppConstants.appWhiteColor,
                                fontSize: 24,
                                align: TextAlign.start,
                                text: "Promo buy 1,\nGet 1 more!",
                                fontWeight: FontWeight.w800,
                              ),
                              const SizeBoxH(10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  maximumSize: Size(Responsive.width * 29, 40),
                                  backgroundColor: AppConstants.appWhiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: Text(
                                  "Order Now",
                                  style: TextStyle(
                                    fontSize: Responsive.text * 1.5,
                                    fontWeight: FontWeight.bold,
                                    color: AppConstants.appPrimaryColor,
                                  ),
                                ),
                              ),
                              const SizeBoxH(10),
                              Row(
                                children: [
                                  Container(
                                    height: 4,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5)),
                                        color: AppConstants.appWhiteColor),
                                  ),
                                  Container(
                                    height: 4,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                        color: AppConstants.appRedLightColor),
                                  )
                                ],
                              ),
                              const SizeBoxH(10),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Responsive.height * 35,
                          child: Image.asset(
                            alignment: Alignment.bottomRight,
                            height: Responsive.height * 35,
                            width: Responsive.width * 45,
                            AppConstants.appHomeBanner,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizeBoxH(20),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Selector<HomeProvider, List<FoodCategoryModel>>(
                          selector: (p0, p1) => p1.foodCategoryList,
                          builder: (context, foodCategoryList, child) =>
                              GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: foodCategoryList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              FoodCategoryModel category =
                                  foodCategoryList[index];
                              return FoodCategoryWidget(
                                foodCategoryModel: category,
                              );
                            },
                          ),
                        ),
                        const SizeBoxH(25),
                        const CommonTextWidget(
                            text: "Top Rated Food",
                            fontWeight: FontWeight.bold,
                            color: AppConstants.appSecondaryColor,
                            fontSize: 18),
                        const SizeBoxH(15),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              context.read<HomeProvider>().foodList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: Responsive.height * 0.090),
                          itemBuilder: (context, index) {
                            FoodModel foodModel =
                                context.read<HomeProvider>().foodList[index];
                            return InkWell(
                              onTap: () {
                                Routes.push(
                                    screen: ProductDetailsScreen(
                                      foodModel: foodModel,
                                    ),
                                    exit: () {},
                                    context: context);
                              },
                              child: FoodWidget(
                                foodModel: foodModel,
                              ),
                            );
                          },
                        ),
                        const SizeBoxH(25),
                        const CommonTextWidget(
                            text: "Restaurants near you",
                            fontWeight: FontWeight.bold,
                            color: AppConstants.appSecondaryColor,
                            fontSize: 18),
                        const SizeBoxH(15),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: Responsive.height * 36,
                left: Responsive.width * 5,
                child: Container(
                  height: 42,
                  width: Responsive.width * 90,
                  decoration: BoxDecoration(
                    color: AppConstants.appWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1.5,
                        offset: const Offset(0, -1),
                      )
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      counterText: '',
                      contentPadding: const EdgeInsets.all(1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: AppConstants.appWhiteColor,
                      filled: true,
                      labelText: "Search food,restaurant,etc",
                      labelStyle: const TextStyle(
                        color: AppConstants.appGreyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
