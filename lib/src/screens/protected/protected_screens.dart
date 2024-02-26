import 'package:flutter/material.dart';
import 'package:my_birthdays_assistant/src/components/base_navigation_bar.dart';
import 'package:my_birthdays_assistant/src/providers/navbar_provider.dart';
import 'package:my_birthdays_assistant/src/screens/protected/home/home_screen.dart';
import 'package:my_birthdays_assistant/src/screens/protected/settings/settings_controller.dart';
import 'package:provider/provider.dart';
import 'package:my_birthdays_assistant/src/screens/protected/settings/settings_screen.dart';

class ProtectedScreens extends StatelessWidget {
  const ProtectedScreens({super.key, required this.controller});
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(builder: (context, navbarProvider, _) {
      return Scaffold(
          appBar: AppBar(backgroundColor: Colors.white),
          bottomNavigationBar: const BaseNavigationBar(),
          body: <Widget>[
            const HomeScreen(),
            SettingsScreen(controller: controller)
          ][navbarProvider.currentPageIndex]);
    });
  }
}
