import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

GoRoute goRoute({
  required String name,
  required String path,
  required Widget child,
}) {
  return GoRoute(
    name: name,
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      arguments: state.extra,
      child: child,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    ),
  );
}
