import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tastehub/core/models/cart_item_model.dart';

class CartNotifier extends Notifier<List<CartItemModel>> {
  @override
  List<CartItemModel> build() {
    return [];
  }

  void addToCart(CartItemModel cartItem) {
    // print("### Food adding :${cartItem.food.name}");

    // index of arrived food in the exiting list >0 or -1 if not
    final exists = state.any((item) => item.food.id == cartItem.food.id);

    // item already exiting let ignore it
    if (exists) {
      increaseQuantity(cartItem);
    } else {
      state = [
        ...state,
        CartItemModel(food: cartItem.food, quantity: cartItem.quantity),
      ];
    }
  }

  void removeFromCart(CartItemModel cartItem) {
    state = state.where((item) => item.food.id != cartItem.food.id).toList();
  }

  void increaseQuantity(CartItemModel cartItem) {
    state =
        state.map((item) {
          // only change the quantity of the item that match id
          if (item.food.id == cartItem.food.id) {
            return item.copyWith(quantity: item.quantity + cartItem.quantity);
          }
          return item;
        }).toList();
  }

  void decreaseQuantity(CartItemModel cartItem) {
    state =
        state.map((item) {
          // only change the quantity of the item that match id
          if (item.food.id == cartItem.food.id && item.quantity > 1) {
            return item.copyWith(quantity: item.quantity - 1);
          }
          return item;
        }).toList();
  }

  void clearCart() {
    state = [];
  }
}
