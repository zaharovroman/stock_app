import 'package:go_router/go_router.dart';
import 'package:stock_app/presentation/favourite/favourite_screen.dart';
import 'package:stock_app/presentation/home/home_screen.dart';
import 'package:stock_app/presentation/navigation/routes.dart';

class StockRouter {
  final goRouter = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.favourite,
        builder: (context, state) {
          return const FavouriteScreen();
        },
      )
    ],
  );
}
