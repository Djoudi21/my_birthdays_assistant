import 'package:flutter/material.dart';
import 'package:my_birthdays_assistant/src/providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class BaseNavigationBar extends StatelessWidget {
  const BaseNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(builder: (context, navbarProvider, _) {
      return NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],
          selectedIndex: navbarProvider.currentPageIndex,
          onDestinationSelected: (int index) {
            navbarProvider.setCurrentPageIndex(index, context);
          });
    });
  }
}
