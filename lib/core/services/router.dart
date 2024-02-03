import 'package:employee_attendance/features/auth/presentation/pages/sign_in_page.dart';
import 'package:employee_attendance/features/auth/presentation/pages/sign_up_page.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppNameRoute.signIn,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: AppNameRoute.signUp,
      builder: (context, state) => const SignUpPage(),
    ),
    // GoRoute(
    //   path: '/home-screen',
    //   name: HomeScreen.routeName,
    //   builder: (context, state) => const HomeScreen(),
    // )
  ],
);

class AppNameRoute {
  AppNameRoute._();
  static const String home = '/home';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
}
