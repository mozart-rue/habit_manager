import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/goal_progress_tile_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class HabitsProgressScreen extends StatelessWidget {
  const HabitsProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: size.width * 0.95,
              child: Column(
                children: [
                  const Gap(30),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          PhosphorIcons.arrow_left,
                          size: 28,
                          color: AppColors.slate200,
                        ),
                      ),
                      const Gap(20),
                      const Text(
                        'Seus Objetivos',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 12, top: 12, left: 4),
                            child: GoalProgressTileComponent(
                              width: size.width * 0.9,
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
