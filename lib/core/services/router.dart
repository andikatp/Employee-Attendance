import 'package:employee_attendance/core/services/injection_container.dart';
import 'package:employee_attendance/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:employee_attendance/features/auth/presentation/pages/sign_in_page.dart';
import 'package:employee_attendance/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum PageTransitionType {
  slideInLeft,
  slideInRight,
  fade,
}

final goRouter = GoRouter(
  initialLocation: '/signIn',
  routes: [
    GoRoute(
      path: '/signIn',
      name: AppNameRoute.signIn,
      pageBuilder: (context, state) => _page(
        state, 
        transitionType: PageTransitionType.slideInRight,
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: const SignInPage(),
        ),
      ),
    ),
    GoRoute(
      path: '/signUp',
      name: AppNameRoute.signUp,
      pageBuilder: (context, state) => _page(
        state,
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: const SignUpPage(),
        ),
      ),
    ),
  ],
);

CustomTransitionPage<dynamic> _page(
  GoRouterState state,
  Widget child, {
  PageTransitionType transitionType = PageTransitionType.slideInLeft,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (transitionType) {
        case PageTransitionType.slideInLeft:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        case PageTransitionType.slideInRight:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        case PageTransitionType.fade:
          return FadeTransition(
            opacity: animation,
            child: child,
          );
      }
    },
    child: child,
  );
}

class AppNameRoute {
  AppNameRoute._();
  static const String home = 'home';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
}
