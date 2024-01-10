import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/display_current_date_component.dart';
import 'package:habit_manager/core/ui/components/goal_tile_component.dart';
import 'package:habit_manager/core/ui/components/habit_circular_progress_component.dart';
import 'package:habit_manager/core/ui/components/habit_tile_component.dart';
import 'package:habit_manager/core/ui/components/header_display_top_itens_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = 'User';
    int totalDailyHabits = 6;
    int dailyHabitsDone = 2;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: SingleChildScrollView(
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
                      gradient: const LinearGradient(
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
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const HabitCircularProgressComponent(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$dailyHabitsDone de $totalDailyHabits Habitos',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.slate100,
                                ),
                              ),
                              const Text(
                                'concluídos hoje',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.slate100,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(30),
                  HeaderDisplayTopItensComponent(
                    title: 'Habitos do dia',
                    onTapSeeAll: () {},
                    children: const [
                      Gap(12),
                      HabitTileComponent(done: true),
                      Gap(8),
                      HabitTileComponent(done: true),
                      Gap(8),
                      HabitTileComponent(),
                    ],
                  ),
                  const Gap(24),
                  HeaderDisplayTopItensComponent(
                    title: 'Seus Objetivos',
                    onTapSeeAll: () {},
                    children: const [
                      Gap(12),
                      GoalTileComponent(),
                      Gap(12),
                      GoalTileComponent(),
                      Gap(12),
                      GoalTileComponent(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
