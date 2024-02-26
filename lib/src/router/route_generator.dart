import 'package:flutter/material.dart';
import 'package:my_birthdays_assistant/src/screens/public/login/login_screen.dart';
import 'package:my_birthdays_assistant/src/screens/protected/protected_screens.dart';
import 'package:my_birthdays_assistant/src/screens/public/register/register_screen.dart';
import 'package:my_birthdays_assistant/src/screens/protected/settings/settings_controller.dart';

class RouteGenerator {
  static const loginPage = '/';
  static const protectedPages = '/protected';
  static const registerPage = '/register';

  static Route<dynamic> generateRoute(RouteSettings routeSettings,
      SettingsController settingsController, BuildContext context) {
    switch (routeSettings.name) {
      case registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case protectedPages:
        return MaterialPageRoute(
            builder: (_) => ProtectedScreens(controller: settingsController));
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        throw const FormatException('Route not found');
    }
  }
}
