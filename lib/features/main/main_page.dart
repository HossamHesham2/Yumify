import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/features/main/favorites/presentation/pages/favorites_page.dart';
import 'package:recipes_generator/features/main/home/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    HomePage(),
    FavoritesPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: ColorsManager.orangeF7,
        backgroundColor: ColorsManager.white,
        animationDuration: Duration(milliseconds: 500),
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: ColorsManager.white),
          Icon(Icons.favorite, color: ColorsManager.white),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
