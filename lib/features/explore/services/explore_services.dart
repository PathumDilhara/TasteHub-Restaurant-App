import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tastehub/features/explore/models/category_card_model.dart';
import 'package:tastehub/features/explore/models/food_model.dart';
import 'package:tastehub/features/explore/models/promo_card_model.dart';

class ExploreServices {
  // get promotional data
  Future<List<PromoCardModel>> fetchPromotions() async {
    final String response = await rootBundle.loadString(
      "assets/json_data/promo_data.json",
    );

    final List<dynamic> data = jsonDecode(response);

    List<PromoCardModel> promos =
        data.map((e) => PromoCardModel.fromJson(e)).toList();

    return promos;
  }

  // fetch categories
  Future<List<CategoryCardModel>> fetchCategories() async {
    final String response = await rootBundle.loadString(
      "assets/json_data/categories.json",
    );

    final List<dynamic> data = jsonDecode(response);

    final List<CategoryCardModel> categories =
        data.map((e) => CategoryCardModel.fromJson(e)).toList();

    return categories;
  }

  // fetch foods
  Future<List<FoodModel>> fetchFoods() async {
    final String response = await rootBundle.loadString(
      "assets/json_data/foods.json",
    );

    final List<dynamic> data = jsonDecode(response);

    final List<FoodModel> foods =
    data.map((e) => FoodModel.fromJson(e)).toList();

    return foods;
  }
}
