import 'package:fullstackoauth/core/route/router_animation.dart';
import 'package:fullstackoauth/features/home/home_screen.dart';
import 'package:fullstackoauth/features/login/login_screen.dart';
import 'package:fullstackoauth/features/login/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => FadeTransitionPage(
        key: state.pageKey,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) => SlideTransitionPage(
        key: state.pageKey,
        child: const SignUpScreen(),
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => ScaleTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
  ],
);
