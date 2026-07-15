import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tastehub/core/utils/colors.dart';
import 'package:tastehub/core/utils/constants.dart';
import 'package:tastehub/core/widgets/custom_button.dart';

import '../../explore/models/food_model.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodModel food;

  const FoodDetailsScreen({super.key, required this.food});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  final ValueNotifier<int> _quantity = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.food.name)),

      body: Stack(
        children: [
          // Food main image
          Positioned(left: 0, right: 0, top: 0, child: _buildFooDImage()),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.36,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(kCardBR * 1.5),
              decoration: BoxDecoration(
                color: AppColors.primWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category
                    Center(
                      child: Text(
                        widget.food.category,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),

                    // Food name
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.food.name,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),

                        Icon(Icons.star, color: Colors.amber, size: 30),
                        SizedBox(width: 10),
                        Text(
                          widget.food.rating.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    // Description
                    Text(
                      widget.food.description,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        height: 1.5,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Ingredients
                    Text(
                      "Ingredients",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          widget.food.ingredients
                              .map((e) => Chip(label: Text(e)))
                              .toList(),
                    ),
                    SizedBox(height: 25),

                    // Quantity
                    ValueListenableBuilder(
                      valueListenable: _quantity,
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            const Text(
                              "Quantity",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),

                            CircleAvatar(
                              child: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (_quantity.value > 1) {
                                    _quantity.value--;
                                  }
                                },
                              ),
                            ),

                            SizedBox(width: 15),

                            Text(
                              value.toString(),
                              style: TextStyle(fontSize: 20),
                            ),

                            SizedBox(width: 15),

                            CircleAvatar(
                              child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  _quantity.value++;
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar()
    );
  }

  // ============================== WIDGETS =====================
  Widget _buildFooDImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: widget.food.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBottomNavBar(){
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Price", style: Theme.of(context).textTheme.bodyLarge,),

                Text(
                    "\$${widget.food.price}",
                    style: Theme.of(context).textTheme.headlineMedium
                ),
              ],
            ),

            customButton(
              context: context,
              title: "Add to Cart",
              bgColor: AppColors.primMain.withValues(alpha: 0.3),
              titleColor: AppColors.primDark,
              width: 150,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
