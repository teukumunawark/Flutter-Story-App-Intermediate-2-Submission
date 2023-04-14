import 'package:go_router/go_router.dart';

import '../pages/add_stories_page.dart';
import '../pages/detail_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/pick_location.dart';
import '../pages/register_page.dart';
import '../pages/splash_page.dart';
import 'component_route.dart';

final router = GoRouter(routes: [
  goRoute(
    name: 'splash',
    path: '/splash',
    child: const SplashPage(),
  ),
  goRoute(
    name: 'register',
    path: '/register',
    child: const RegisterPage(),
  ),
  goRoute(
    name: 'login',
    path: '/login',
    child: const LoginPage(),
  ),
  goRoute(
    name: 'home',
    path: '/',
    child: const HomePage(),
    routes: [
      goRoute(
        name: 'add-stories',
        path: 'add-stories',
        child: const AddStoriesPage(),
      ),
      goRoute(
        name: 'pick-location',
        path: 'pick-location',
        child: const PickLocation(),
      ),
      GoRoute(
          name: 'detail',
          path: 'detail/:id',
          pageBuilder: (context, state) {
            String id = state.params['id'] ?? '';
            return CustomTransitionPage(
              key: state.pageKey,
              arguments: state.extra,
              child: DetailPage(id: id),
              transitionsBuilder: transitionsBuilder(),
            );
          }),
    ],
  ),
], initialLocation: '/splash', debugLogDiagnostics: true, routerNeglect: true);
