import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/habit_tile_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class YourHabitsScreen extends StatefulWidget {
  const YourHabitsScreen({super.key});

  @override
  State<YourHabitsScreen> createState() => _YourHabitsScreenState();
}

class _YourHabitsScreenState extends State<YourHabitsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: size.width * 0.9,
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
                        'Seus Habitos',
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
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 6, top: 6),
                            child: HabitTileComponent(),
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
