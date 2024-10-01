import 'package:auxzonfood/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bottom_navigation_bar_provider.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<BottomNavigationBarProvider>(
          builder: (context, value, child) => Center(
            child: value.widgetOptions.elementAt(value.selectedIndex),
          ),
        ),
        bottomNavigationBar: Selector<BottomNavigationBarProvider, int>(
          selector: (p0, p1) => p1.selectedIndex,
          builder: (context, selectedIndex, child) => BottomNavigationBar(
            selectedFontSize: 1,
            unselectedFontSize: 1,
            backgroundColor: AppConstants.appWhiteColor,
            onTap: (value) {
              context
                  .read<BottomNavigationBarProvider>()
                  .onItemTapped(index: value);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: CircleAvatar(
                    radius: 20,
                    backgroundColor: selectedIndex == 0
                        ? AppConstants.appPrimaryColor
                        : AppConstants.appWhiteColor,
                    child: Icon(
                      selectedIndex == 0
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 28,
                      color: selectedIndex == 0
                          ? AppConstants.appWhiteColor
                          : AppConstants.appSecondaryColor,
                    )),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                    radius: 20,
                    backgroundColor: selectedIndex == 1
                        ? AppConstants.appPrimaryColor
                        : AppConstants.appWhiteColor,
                    child: Icon(
                      selectedIndex == 1 ? Icons.home : Icons.home_outlined,
                      size: 28,
                      color: selectedIndex == 1
                          ? AppConstants.appWhiteColor
                          : AppConstants.appSecondaryColor,
                    )),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                    radius: 20,
                    backgroundColor: selectedIndex == 2
                        ? AppConstants.appPrimaryColor
                        : AppConstants.appWhiteColor,
                    child: Icon(
                      selectedIndex == 0
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined,
                      size: 28,
                      color: selectedIndex == 2
                          ? AppConstants.appWhiteColor
                          : AppConstants.appSecondaryColor,
                    )),
                label: '',
              ),
            ],
          ),
        ));
  }
}
