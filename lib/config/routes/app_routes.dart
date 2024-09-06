import 'package:flutter/material.dart';
import 'package:recipe_app/Features/login/screen/login_screen.dart';
import 'package:recipe_app/Features/nav/screen/nav_bar_screen.dart';
import 'package:recipe_app/Features/recpie/screen/recipe_screen.dart';
import 'package:recipe_app/Features/splash/screens/splash_screen.dart';
import 'package:recipe_app/config/routes/base_routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String splashScreen = "SplashScreen";
  static const String homeScreen = "HomeScreen";
  static const String loginScreen = "LoginScreen";
  static const String recipeScreen = "RecipeScreen";
  static const String navbarScreen = "NavBar";
  static const String uploadBookScreen = "UploadBookScreen";
  static BuildContext currentContext = navigatorKey.currentContext!;
  static Route<void>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    // final Database database;
    switch (settings.name) {
      case splashScreen:
        return BaseRoute(page: const SplashScreen());
      case loginScreen:
        return BaseRoute(page: const LoginScreen());
      case recipeScreen:
        return BaseRoute(page: RecipeScreen());
      case   navbarScreen:
      return BaseRoute(page: const NavBar());
    }
  }
}
