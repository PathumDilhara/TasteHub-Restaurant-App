import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tastehub/features/explore/models/category_card_model.dart';
import 'package:tastehub/features/explore/models/food_model.dart';
import 'package:tastehub/features/explore/models/promo_card_model.dart';
import 'package:tastehub/features/explore/services/explore_services.dart';

final exploreServiceProvider = Provider<ExploreServices>((ref) {
  return ExploreServices();
});

final promoProvider = FutureProvider<List<PromoCardModel>>((ref) async {
  final service = ref.watch(exploreServiceProvider);

  return service.fetchPromotions();
});

final categoriesProvider = FutureProvider<List<CategoryCardModel>>((ref) async {
  final service = ref.watch(exploreServiceProvider);

  return service.fetchCategories();
});

final foodProvider = FutureProvider<List<FoodModel>>((ref) async {
  final service = ref.watch(exploreServiceProvider);

  return service.fetchFoods();
});
