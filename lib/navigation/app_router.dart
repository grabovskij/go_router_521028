import 'package:go_router/go_router.dart';
import 'package:go_router_521028/features/authentication/auth_info.dart';
import 'package:go_router_521028/features/main_screen.dart';
import 'package:go_router_521028/features/news/news_page.dart';
import 'package:go_router_521028/features/search/search_page.dart';
import 'package:go_router_521028/features/user/user_details_page.dart';
import 'package:go_router_521028/features/user/user_page.dart';

import 'app_routes.dart';

class AppRouter {
  static GoRouter create(AuthInfo authInfo) {
    return GoRouter(
      initialLocation: AppRoutes.news.path,
      routes: [
        ShellRoute(
          routes: [
            GoRoute(
              path: AppRoutes.news.path,
              name: AppRoutes.news.name,
              builder: (context, state) => const NewsPage(),
            ),
            GoRoute(
              path: AppRoutes.search.path,
              name: AppRoutes.search.name,
              builder: (context, state) => const SearchPage(),
            ),
            GoRoute(
                path: AppRoutes.user.path,
                name: AppRoutes.user.name,
                builder: (context, state) => const UserPage(),
                routes: [
                  GoRoute(
                    path: AppRoutes.userDetails.path,
                    name: AppRoutes.userDetails.name,
                    builder: (context, state) => UserDetailsPage(
                        id: state.uri.queryParameters['id'] as String,
                      ),
                  ),
                ]),
          ],
          builder: (context, state, widget) => MainScreen(
            child: widget,
          ),
        )
      ],
    );
  }
}
