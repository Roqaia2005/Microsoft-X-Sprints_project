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
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(path: kCartView, builder: (context, state) => const CartView()),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text("Page not found"))),
  );
}
