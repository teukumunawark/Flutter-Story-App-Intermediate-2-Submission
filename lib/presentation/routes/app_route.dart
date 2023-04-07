import 'package:go_router/go_router.dart';

import '../pages/add_stories_page.dart';
import '../pages/detail_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/splash_page.dart';
import 'component_route.dart';

final router = GoRouter(
  routes: [
    goRoute(
      name: 'splash',
      path: '/',
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
      path: '/home',
      child: const HomePage(),
    ),
    goRoute(
      name: 'detail',
      path: '/detail',
      child: const DetailPage(),
    ),
    goRoute(
      name: 'add-stories',
      path: '/add-stories',
      child: const AddStoriesPage(),
    ),
  ],
);
