import 'dart:developer';

import 'package:auxzonfood/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/extentions.dart';
import '../../cart/view/cart_screen.dart';
import '../../home/view/home_screen.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int selectedIndex = 1;
  final List<Widget> widgetOptions = <Widget>[
    Container(
      color: AppConstants.appRedLightColor,
      child: Center(
          child: Image.asset(
        AppConstants.appNoDataImg,
        height: Responsive.height * 30,
      )),
    ),
    const HomeScreen(),
    const CartScreen()
  ];

  void onItemTapped({required int index}) {
    selectedIndex = index;
    log('selectedIndex $selectedIndex');
    notifyListeners();
  }
}
