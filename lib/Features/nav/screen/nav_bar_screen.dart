import 'package:flutter/material.dart';
import 'package:recipe_app/Features/favoirte/screen/favoirte_screen.dart';
import 'package:recipe_app/Features/recpie/screen/recipe_screen.dart';
import 'package:recipe_app/core/utils/color_manager.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex=0;
  List<Widget>screens=[
    const RecipeScreen(),
    const FavoriteScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        }, 
        backgroundColor: ColorManager.white,
        elevation: 0.0,
        selectedIconTheme: IconThemeData(color: ColorManager.primary),
        unselectedIconTheme: IconThemeData(color: ColorManager.grey19),
        items:const  [
          BottomNavigationBarItem(icon: Icon(Icons.food_bank ),label: 'Recipes'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite ')
        ],
      ),
    );
  }
}