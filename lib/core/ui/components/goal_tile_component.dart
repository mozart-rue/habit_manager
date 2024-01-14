import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class GoalTileComponent extends StatelessWidget {
  const GoalTileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.slate700),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Estudy german every day',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.slate100,
                  ),
                ),
                const Gap(6),
                SizedBox(
                  width: size.width * 0.6,
                  child: LinearProgressIndicator(
                    value: 0.6,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(3),
                    backgroundColor: AppColors.slate400,
                    color: AppColors.blue,
                  ),
                ),
                const Gap(4),
                const Text(
                  '5 out of 7 days',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.slate100,
                  ),
                ),
                const Gap(2),
                const Text(
                  'frequency',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
            PopupMenuButton(
              icon: const Icon(
                PhosphorIcons.dots_three_vertical,
                color: AppColors.slate200,
              ),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text('Editar'),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text('Deletar'),
                  ),
                ];
              },
              onSelected: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
