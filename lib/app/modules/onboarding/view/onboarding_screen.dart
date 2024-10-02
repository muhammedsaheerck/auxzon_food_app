import 'package:auxzonfood/app/utils/app_router.dart';
import 'package:flutter/material.dart';

import '../../../helpers/common_widgets.dart';
import '../../../helpers/size_box.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extentions.dart';
import '../../bottom navigation/view/bottom_navigation_bar_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          height: Responsive.height * 100,
          width: Responsive.width * 100,
          child: Stack(
            children: [
              Container(
                  height: Responsive.height * 70,
                  width: Responsive.width * 100,
                  color: Colors.grey[200],
                  child: Image.asset(
                    AppConstants.appOnboardOne,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 16, right: 16, top: Responsive.height * 8),
                  decoration: const ShapeDecoration(
                    shape: TopCircleShape(circleSize: 65),
                    color: Colors.white,
                  ),
                  height: Responsive.height * 40,
                  width: Responsive.width * 100,
                  child: Column(
                    children: [
                      CommonTextWidget(
                        color: Colors.black,
                        text: "The Fastest In",
                        fontSize: Responsive.text * 2.9,
                        fontWeight: FontWeight.w700,
                        align: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextWidget(
                            color: Colors.black,
                            text: "Delivey",
                            fontSize: Responsive.text * 2.9,
                            fontWeight: FontWeight.w700,
                            align: TextAlign.center,
                          ),
                          const SizeBoxV(8),
                          CommonTextWidget(
                            color: AppConstants.appPrimaryColor,
                            text: "Food",
                            fontSize: Responsive.text * 2.9,
                            fontWeight: FontWeight.w700,
                            align: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizeBoxH(10),
                      CommonTextWidget(
                        text:
                            "Our jo is to filling your tummy with\ndelicious food and fast delivery.",
                        fontSize: Responsive.text * 1.5,
                        align: TextAlign.center,
                        color: AppConstants.appGreyColor,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                      const SizeBoxH(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                                color: AppConstants.appSecondaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          const SizeBoxV(3),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                                color: AppConstants.appSecondaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          const SizeBoxV(3),
                          Container(
                            height: 5,
                            width: 25,
                            decoration: const BoxDecoration(
                                color: AppConstants.appYellowColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ],
                      ),
                      const SizeBoxH(40),
                      ElevatedButton(
                        onPressed: () {
                          Routes.pushRemoveUntil(
                            context: context,
                            screen: const BottomNavigationBarScreen(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(Responsive.width * 80, 50),
                          backgroundColor: AppConstants.appPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: Responsive.text * 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class TopCircleShape extends ShapeBorder {
  final double circleSize;

  const TopCircleShape({this.circleSize = 50.0});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    // Draw the main rectangle from top + circleSize to bottom
    path.addRect(Rect.fromLTRB(
        rect.left, rect.top + circleSize, rect.right, rect.bottom));

    // Draw the top arc
    path.addArc(
      Rect.fromLTWH(rect.left, rect.top, rect.width, circleSize * 2),
      3.14, // Start from PI (left side)
      3.14, // Sweep PI radians (half circle)
    );

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return TopCircleShape(circleSize: circleSize * t);
  }
}
