import 'package:flutter/material.dart';

import '../model/food_category_model.dart';
import '../model/food_model.dart';

class HomeProvider extends ChangeNotifier {
  List<FoodCategoryModel> foodCategoryList = [
    FoodCategoryModel(
      name: "Rice",
      icon: Icons.rice_bowl_outlined,
      id: "rice",
    ),
    FoodCategoryModel(
      name: "Ice",
      icon: Icons.icecream_outlined,
      id: "Ice",
    ),
    FoodCategoryModel(
      name: "Drinks",
      icon: Icons.local_drink_outlined,
      id: "rice",
    ),
    FoodCategoryModel(
      name: "cookies",
      icon: Icons.cookie,
      id: "rice",
    ),
  ];

  List<FoodModel> foodList = [
    FoodModel(
      name: "Burger Combo",
      image: "assets/images/image-1.jpg",
      price: "65",
      description: "Burger Boss",
      rating: "4.5",
    ),
    FoodModel(
      name: "Showerma Roll",
      image: "assets/images/image-2.jpg",
      price: "20",
      description: "Shawarbica",
      rating: "4.0",
    ),
    FoodModel(
      name: "Burger",
      image: "assets/images/image-6.jpg",
      price: "35",
      description: "Burger Boss",
      rating: "4.5",
    ),
    FoodModel(
      name: " Hummer Burger",
      image: "assets/images/image-7.jpg",
      price: "85",
      description: "Burger Boss",
      rating: "4.8",
    ),
  ];
}
