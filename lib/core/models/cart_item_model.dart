import '../../features/explore/models/food_model.dart';

class CartItemModel {
  final FoodModel food;
  final int quantity;

  CartItemModel({required this.food, this.quantity = 1});

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(food: food, quantity: quantity ?? this.quantity);
  }

  double get totalPrice => food.price * quantity;
}
