import 'package:go_router/go_router.dart';
import 'package:tastehub/core/router/router_paths.dart';
import 'package:tastehub/features/explore/screens/explore_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/${RouterPaths.explore}",
    routes: [
      GoRoute(
        path: "/${RouterPaths.explore}",
        builder: (context, state) => ExploreScreen(),
      ),
    ],
  );
}
