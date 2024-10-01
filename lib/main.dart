import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/modules/bottom navigation/controller/bottom_navigation_bar_provider.dart';
import 'app/modules/home/controller/home_provider.dart';
import 'app/modules/onboarding/view/onboarding_screen.dart';
import 'app/modules/product details/controller/product_details_provider.dart';
import 'app/utils/extentions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          Responsive().init(constraints, orientation);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeProvider()),
              ChangeNotifierProvider(
                  create: (_) => BottomNavigationBarProvider()),
              ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
            ],
            child: MaterialApp(
              title: 'Auxzone Food',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
                useMaterial3: true,
              ),
              home: const OnboardingScreen(),
            ),
          );
        },
      ),
    );
  }
}
