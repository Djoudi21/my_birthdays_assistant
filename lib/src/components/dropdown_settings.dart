import 'package:my_birthdays_assistant/src/screens/protected/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class DropdownSettings extends StatelessWidget {
  const DropdownSettings({super.key, required this.controller});
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ThemeMode>(
      // Read the selected themeMode from the controller
      value: controller.themeMode,
      // Call the updateThemeMode method any time the user selects a theme.
      onChanged: controller.updateThemeMode,
      items: const [
        DropdownMenuItem(
          value: ThemeMode.system,
          child: Text('System Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.light,
          child: Text('Light Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text('Dark Theme'),
        )
      ],
    );
  }
}
