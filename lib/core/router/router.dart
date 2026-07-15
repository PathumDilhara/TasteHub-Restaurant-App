import 'package:go_router/go_router.dart';
import 'package:tastehub/core/router/router_paths.dart';
import 'package:tastehub/features/auth/screens/login_screen.dart';
import 'package:tastehub/features/explore/screens/explore_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/${RouterPaths.login}",
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
    ],
  );
}
