import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class HabitCircularProgressComponent extends StatelessWidget {
  const HabitCircularProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 90,
      width: 90,
      child: Stack(
        children: [
          SizedBox(
            height: 90,
            width: 90,
            child: CircularProgressIndicator(
              backgroundColor: AppColors.slate800,
              color: AppColors.slate200,
              strokeWidth: 8,
              value: 0.33,
            ),
          ),
          Center(
            child: Text(
              '33 %',
              style: TextStyle(
                color: AppColors.slate100,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
