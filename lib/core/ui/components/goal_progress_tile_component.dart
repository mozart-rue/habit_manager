import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class GoalProgressTileComponent extends StatelessWidget {
  final double width;
  const GoalProgressTileComponent({this.width = 200, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: 0.9,
                    color: AppColors.greenDark,
                    backgroundColor: AppColors.slate900,
                  ),
                ),
                Center(
                  child: Text(
                    '90 %',
                    style: TextStyle(color: AppColors.slate100),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'Ler A Cronica do Matador do Rei',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.slate100,
                ),
              ),
              Text(
                '5 out of 7 days',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.slate100,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greenDark),
              borderRadius: BorderRadius.circular(18),
              color: AppColors.greenLight,
            ),
            child: Center(
              child: Text(
                'Conquistado',
                style: TextStyle(
                  color: AppColors.greenDark,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
