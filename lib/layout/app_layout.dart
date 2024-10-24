import 'package:flutter/material.dart';
import 'package:homey_park_mobile_app/views/search_parking.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.search), label: "Buscar"),
          NavigationDestination(
              icon: Icon(Icons.app_registration_rounded), label: "Register"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: [
        const SearchParking(),
        const Placeholder(),
        const Placeholder(),
      ][currentPageIndex],
    );
  }
}
