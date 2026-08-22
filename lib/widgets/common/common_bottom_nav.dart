
import 'package:flutter/material.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/constants/app_sizes.dart';

class CommonBottomNav extends StatelessWidget{
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CommonBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:const BorderRadius.only(
        topLeft: Radius.circular(AppSizes.radiusLarge),
        topRight: Radius.circular(AppSizes.radiusLarge),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        backgroundColor: AppColors.white,
        destinations:const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined), 
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
      
          NavigationDestination(
            icon: Icon(Icons.star_border_outlined), 
            selectedIcon: Icon(Icons.star),
            label: 'Favourites',
          ),
      
          NavigationDestination(
            icon: Icon(Icons.delete_outlined), 
            selectedIcon: Icon(Icons.delete),
            label: 'Deleted',
          ),  
        ],
      ),
    );
  }
}