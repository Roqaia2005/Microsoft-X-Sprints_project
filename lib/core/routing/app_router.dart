import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:souqak/features/home/ui/views/cart_view.dart';
import 'package:souqak/features/home/ui/views/home_view.dart';
import 'package:souqak/features/auth/ui/views/login_view.dart';
import 'package:souqak/features/auth/ui/views/signup_view.dart';
import 'package:souqak/features/home/ui/views/welcome_view.dart';

abstract class AppRouter {
  static const String kWelcomeView = '/';
  static const String kLoginView = '/loginView';
  static const String kSignupView = '/signupView';
  static const String kHomeView = '/homeView';
  static const String kCartView = '/cartView';
  static const String kOrderView = '/orderView';
  static const String kProfileView = '/profileView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kWelcomeView,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kSignupView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: SignupView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 900),
          );
        },
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 900),
          );
        },
      ),
      GoRoute(path: kCartView, builder: (context, state) => const CartView()),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text("Page not found"))),
  );
}
