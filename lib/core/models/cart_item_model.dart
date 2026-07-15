import '../../features/explore/models/food_model.dart';

class CartItem {
  final FoodModel food;
  final int quantity;

  CartItem({required this.food, this.quantity = 1});

  CartItem copyWith({int? quantity}) {
    return CartItem(food: food, quantity: quantity ?? this.quantity);
  }

  double get totalPrice => food.price * quantity;
}
