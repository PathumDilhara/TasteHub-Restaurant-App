import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/explore/models/food_model.dart';
import 'search_notifier.dart';
import 'app_providers.dart';

final searchProvider = NotifierProvider<SearchNotifier, String>(
  SearchNotifier.new,
);

final filteredFoodsProvider = Provider<List<FoodModel>>((ref) {
  final foodsAsync = ref.watch(foodProvider);

  final query = ref.watch(searchProvider).toLowerCase();

  return foodsAsync.when(
    data: (foods) {
      if (query.isEmpty) {
        return foods;
      }
      return foods.where((food) {
        return food.name.toLowerCase().contains(query);
      }).toList();
    },

    loading: () => [],
    error: (_, __) => [],
  );
});
