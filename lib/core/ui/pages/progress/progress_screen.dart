import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:habit_manager/core/ui/components/bottom_navigation_bar_icon.dart';
import 'package:habit_manager/core/ui/components/counter_habits_progress_text.dart';
import 'package:habit_manager/core/ui/components/goal_progress_tile_component.dart';
import 'package:habit_manager/core/ui/components/header_display_top_itens_component.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarIcon(currentIndex: 2),
      body: AppBackgroundScreen(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Gap(30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(12),
                      Text(
                        'Progresso',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  HeaderDisplayTopItensComponent(
                      title: 'Seus Objetivos',
                      onTapSeeAll: () {
                        Navigator.of(context).pushNamed('/habits-progress');
                      },
                      children: [
                        const Gap(30),
                        const SizedBox(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: CircularProgressIndicator(
                                  strokeWidth: 10,
                                  value: 0.6,
                                  color: AppColors.blue,
                                  backgroundColor: AppColors.slate900,
                                ),
                              ),
                              Center(
                                child: Text(
                                  '60%',
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(18),
                        const CouterHabitsProgressText(
                          content: '11 Habitos alcançados',
                          icon: PhosphorIcons.check,
                          color: AppColors.blue,
                        ),
                        const CouterHabitsProgressText(
                          content: '11 Habitos ainda não alcançados',
                          icon: PhosphorIcons.x,
                          color: AppColors.slate300,
                        ),
                        const Gap(30),
                        ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 22),
                                child: GoalProgressTileComponent(
                                  width: size.width * 0.9,
                                ),
                              );
                            }),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
