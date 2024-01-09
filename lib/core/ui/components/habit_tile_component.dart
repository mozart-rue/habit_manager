import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class HabitTileComponent extends StatelessWidget {
  final bool done;
  const HabitTileComponent({this.done = false, super.key});

  static const Color doneLight = AppColors.greenLight;
  static const Color doneStrong = AppColors.greenDark;

  static const Color todoLight = AppColors.slate100;
  static const Color todoStrong = AppColors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: done ? doneLight : todoLight,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'concluídos hoje',
              style: TextStyle(
                fontSize: 18,
                color: done ? doneStrong : todoStrong,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: doneStrong,
                  value: done,
                  onChanged: (value) {},
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(PhosphorIcons.dots_three_vertical),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}