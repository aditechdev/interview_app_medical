import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/auth/screen/auth_screen.dart';
import 'package:interview_app_medical/features/home/screen/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // Home Screen
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (__) => const HomeScreen());

    // Auth Screen
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (__) => const AuthScreen());

    default:
      return MaterialPageRoute(
        builder: (__) => const Scaffold(
          body: Center(child: Text("No data")),
        ),
      );
  }
}
