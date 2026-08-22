import 'package:go_router/go_router.dart';
import 'package:note_app/screens/deleted/deleted_screen.dart';
import 'package:note_app/screens/favourites/favourites_screen.dart';
import 'package:note_app/screens/home/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [

      GoRoute(
        path: '/home',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomeScreen()
          );
        },
      ),

      GoRoute(
        path: '/favourites',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: FavouritesScreen()
          );
        },
      ),

      GoRoute(
        path: '/deleted',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: DeletedScreen()
          );
        },
      ),

    ],
  );
}