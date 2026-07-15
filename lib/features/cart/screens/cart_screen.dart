import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tastehub/core/models/cart_item_model.dart';
import 'package:tastehub/core/router/router_paths.dart';
import 'package:tastehub/core/utils/colors.dart';
import 'package:tastehub/core/utils/constants.dart';
import 'package:tastehub/core/widgets/custom_button.dart';

import '../../../core/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  final double pad;
  const CartScreen({super.key, required this.pad,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    final totalAmount = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body:
          cartItems.isEmpty
              ? Center(
                child: Text(
                  "Your cart is empty",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kCardBR),
                      color: AppColors.primMain.withValues(alpha: 0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(kMainPadding),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Food Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(kCardBR),
                            child: Image.network(
                              item.food.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),

                          // Details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.food.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 3),

                              Text(
                                "\$${item.food.price}",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 3),

                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      CartItemModel cartItem = CartItemModel(
                                        food: item.food,
                                      );

                                      if (item.quantity == 1) {
                                        ref
                                            .read(cartProvider.notifier)
                                            .removeFromCart(cartItem);
                                      } else {
                                        ref
                                            .read(cartProvider.notifier)
                                            .decreaseQuantity(cartItem);
                                      }
                                    },
                                    icon: Icon(Icons.remove_circle_outline),
                                  ),

                                  Text(
                                    item.quantity.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      CartItemModel cartItem = CartItemModel(
                                        food: item.food,
                                      );
                                      ref
                                          .read(cartProvider.notifier)
                                          .increaseQuantity(cartItem);
                                    },

                                    icon: Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Item total
                          Text(
                            "\$${item.totalPrice}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

      bottomNavigationBar:
          cartItems.isEmpty
              ? null
              : SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: pad,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          Text(
                            "\$${totalAmount.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      customButton(
                        context: context,
                        title: "Place Order",
                        titleColor: AppColors.primDark,
                        bgColor: AppColors.primMain.withValues(alpha: 0.3),
                        width: double.infinity,
                        onTap: () {
                          ref.read(cartProvider.notifier).clearCart();
                          GoRouter.of(
                            context,
                          ).push("/${RouterPaths.orderSuccess}");
                        },
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
