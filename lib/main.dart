import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

void main() {
  final router = GoRouter(
    initialLocation: "/login",
    routes: 
  [
        GoRoute(
          path: "/login",
          builder: (context, state) {
            return LoginScreen();
          },
        ),
        GoRoute(
          path: "/signup",
          builder: (context, state) {
            return SignupScreen();
          },
        ),
      ],
  );

  

  runApp(
    MaterialApp.router(
      routerConfig:router,
    ),
  );
}
