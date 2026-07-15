import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tastehub/core/providers/app_providers.dart';
import 'package:tastehub/core/router/router_paths.dart';
import 'package:tastehub/core/utils/colors.dart';
import 'package:tastehub/core/utils/constants.dart';
import 'package:tastehub/features/explore/models/category_card_model.dart';
import 'package:tastehub/features/explore/models/food_model.dart';

import '../../../core/widgets/custom_button.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: kMainPadding,
          right: kMainPadding,
          top: kMainPadding * 3,
          bottom: kMainPadding * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // topbar
            _buildTopBar(),
            SizedBox(height: 40),

            // Promotional card
            _buildPromotionalCard(screenWidth, screenHeight),
            SizedBox(height: 30),

            // Categories
            Text("Categories", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10),
            _buildCategoriesCards(),
            SizedBox(height: 30),

            // Categories
            Text("Foods", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10),
            _buildFoodCards(),
          ],
        ),
      ),
    );
  }

  // ======================== WIDGETS =============================

  Widget _buildTopBar() {
    return Row(
      children: [
        Image.asset("assets/images/tastehub_o.png", width: 100),
        Spacer(),

        // notifications
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.primMain.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon((Icons.notifications_none_outlined)),
          ),
        ),
        SizedBox(width: 20),

        // User profile
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset("assets/images/person.jpg"),
          ),
        ),
      ],
    );
  }

  // Animating Promotional card
  Widget _buildPromotionalCard(double screenWidth, double screenHeight) {
    final promos = ref.watch(promoProvider);

    return promos.when(
      data: (data) {
        return Stack(
          children: [
            // promo image
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kCardBR),
                child: Image.asset(data[1].promoImageUrl, fit: BoxFit.cover),
              ),
            ),

            // Button
            Positioned(
              left: 50,
              child: customButton(
                context: context,
                title: "Buy Now",
                bgColor: Colors.transparent,
                titleColor: AppColors.primWhite,
                onTap: () {},
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return Text("Error");
      },
      loading: () {
        return CircularProgressIndicator();
      },
    );
  }

  // categories
  Widget _buildCategoriesCards() {
    final data = ref.watch(categoriesProvider);
    return SizedBox(
      height: 180,
      child: data.when(
        data:
            (categories) => ListView.builder(
              itemCount: categories.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                late CategoryCardModel category;
                if (index < 10) {
                  category = categories[index];
                } else {
                  category = categories[0];
                }
                return (index < 10)
                    ? Container(
                      margin: EdgeInsets.all(5),
                      width: 150,
                      // height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(kCardBR),
                            child: CachedNetworkImage(
                              imageUrl: category.categoryImageUrl,
                              placeholder:
                                  (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              errorWidget:
                                  (context, url, error) => Icon(Icons.error),
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                          ),
                          SizedBox(height: 3),
                          Expanded(
                            child: Text(
                              category.categoryName,
                              softWrap: true,
                              maxLines: 1,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : Center(
                      child: customButton(
                        context: context,
                        title: "see more",
                        bgColor: Colors.blue,
                        titleColor: AppColors.primWhite,
                        onTap: () {},
                      ),
                    );
              },
            ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  // categories
  Widget _buildFoodCards() {
    final data = ref.watch(foodProvider);
    return SizedBox(
      height: 160,
      child: data.when(
        data:
            (foods) => ListView.builder(
              itemCount: foods.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                late FoodModel food;
                if (index < 10) {
                  food = foods[index];
                } else {
                  food = foods[0];
                }
                return (index < 10)
                    ? Container(
                      margin: EdgeInsets.all(5),
                      width: 80,
                      // height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kCardBR),
                        // color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).push("/${RouterPaths.foodDetails}",
                                extra: food);
                              },
                              child: CachedNetworkImage(
                                imageUrl: food.imageUrl,
                                placeholder:
                                    (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                errorWidget:
                                    (context, url, error) => Icon(Icons.error),
                                fit: BoxFit.fitHeight,
                                height: 100,
                              ),
                            ),
                          ),
                          SizedBox(height: 3),
                          Expanded(
                            child: Text(
                              food.name,
                              softWrap: true,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    )
                    : Center(
                      child: customButton(
                        context: context,
                        title: "see more",
                        bgColor: Colors.blue,
                        titleColor: AppColors.primWhite,
                        onTap: () {},
                      ),
                    );
              },
            ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
