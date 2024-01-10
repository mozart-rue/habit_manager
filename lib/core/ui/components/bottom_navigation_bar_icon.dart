import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class BottomNavigationBarIcon extends StatelessWidget {
  final int currentIndex;
  const BottomNavigationBarIcon({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      selectedIndex: currentIndex,
      onTap: (int i) {
        if (i == 0) {
          Navigator.of(context).pushNamed('/account');
        }
        if (i == 1) {
          Navigator.of(context).pushNamed('/home');
        }
        if (i == 2) {
          Navigator.of(context).pushNamed('/progress');
        }
      },
      backgroundColor: AppColors.slate800,
      items: const [
        BottomBarItem(
          icon: Icon(PhosphorIcons.gear),
          activeColor: AppColors.blue,
          inactiveColor: AppColors.slate300,
        ),
        BottomBarItem(
          icon: Icon(PhosphorIcons.house_simple),
          activeColor: AppColors.blue,
          inactiveColor: AppColors.slate300,
        ),
        BottomBarItem(
          icon: Icon(PhosphorIcons.trend_up),
          activeColor: AppColors.blue,
          inactiveColor: AppColors.slate300,
        ),
      ],
    );
  }
}
