import 'package:car_showroom/Screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cars_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const CarsScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          _currentIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
