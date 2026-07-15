import 'package:go_router/go_router.dart';
import 'package:tastehub/core/bottom_navigaion/bottom_navigation.dart';
import 'package:tastehub/core/router/router_paths.dart';
import 'package:tastehub/features/auth/screens/login_screen.dart';
import 'package:tastehub/features/cart/screens/cart_screen.dart';
import 'package:tastehub/features/explore/models/food_model.dart';
import 'package:tastehub/features/explore/screens/explore_screen.dart';
import 'package:tastehub/features/ordering/screens/order_success_screen.dart';
import 'package:tastehub/features/single_food_detaills/screens/single_food_details.dart';
import 'package:tastehub/features/splash/screens/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/${RouterPaths.splash}", // splash
    routes: [
      // Explore screen
      GoRoute(
        path: "/${RouterPaths.explore}",
        builder: (context, state) => ExploreScreen(),
      ),

      // Login screen
      GoRoute(
        path: "/${RouterPaths.login}",
        builder: (context, state) => LoginScreen(),
      ),

      // Bottom navigation screen
      GoRoute(
        path: "/${RouterPaths.bottomNavigation}",
        builder: (context, state) => BottomNavigationScreen(),
      ),

      // Food details screen
      GoRoute(
        path: "/${RouterPaths.foodDetails}",
        builder: (context, state) {
          final FoodModel food = state.extra as FoodModel;
          return FoodDetailsScreen(food: food);
        },
      ),

      // Cart screen
      GoRoute(
        path: "/${RouterPaths.cart}",
        builder: (context, state) {
          final pad = state.extra as double;
          return CartScreen(pad: pad,);
        },
      ),

      // Order success screen
      GoRoute(
        path: "/${RouterPaths.orderSuccess}",
        builder: (context, state) => OrderSuccessScreen(),
      ),

      // Splash screen
      GoRoute(
        path: "/${RouterPaths.splash}",
        builder: (context, state) => SplashScreen(),
      ),
    ],
  );
}
