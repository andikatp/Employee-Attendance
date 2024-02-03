import 'package:employee_attendance/core/services/injection_container.dart';
import 'package:employee_attendance/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:employee_attendance/features/auth/presentation/pages/sign_in_page.dart';
import 'package:employee_attendance/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/signIn',
  routes: [
    GoRoute(
      path: '/signIn',
      name: AppNameRoute.signIn,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      path: '/signUp',
      name: AppNameRoute.signUp,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          const curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        child: BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: const SignUpPage(),
        ),
      ),
    ),
  ],
);

class AppNameRoute {
  AppNameRoute._();
  static const String home = 'home';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
}
