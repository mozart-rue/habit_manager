import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/components/bottom_navigation_bar_icon.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarIcon(currentIndex: 0),
      body: AppBackgroundScreen(
        child: Container(),
      ),
    );
  }
}
