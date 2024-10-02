import 'package:auxzonfood/app/modules/home/model/food_model.dart';
import 'package:auxzonfood/app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  int productCountForCheckout = 1;

  void addCountForCart() {
    productCountForCheckout++;
    notifyListeners();
  }

  void removeCountForCart() {
    if (productCountForCheckout > 1) {
      productCountForCheckout--;
      notifyListeners();
    }
  }

  List<FoodModel> cartItems = [];

  void addToCart(FoodModel item, BuildContext context) {
    if (!cartItems.contains(item)) {
      cartItems.add(item);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
          content: Text(
            'Product added to cart',
            style: TextStyle(color: AppConstants.appWhiteColor),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppConstants.appPrimaryColor,
          duration: Duration(milliseconds: 800),
          content: Text(
            'Product already added',
            style: TextStyle(color: AppConstants.appWhiteColor),
          ),
        ),
      );
    }

    notifyListeners();
  }
}
