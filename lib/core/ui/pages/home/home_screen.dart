import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/display_current_date_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = 'User';
    Size size = MediaQuery.of(context).size;
    return AppBackgroundScreen(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              const DisplayCurrentDateComponent(),
              const Gap(8),
              Row(
                children: [
                  const Text(
                    'Olá, ',
                    style: TextStyle(
                      color: AppColors.slate100,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: AppColors.blue,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                width: size.width * 0.9,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.blue,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.blue,
                      AppColors.lightBlue,
                      AppColors.lightestBlue,
                    ],
                    stops: [0.20, 0.45, 0.75],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
