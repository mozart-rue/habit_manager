import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class DisplayDatePickedComponent extends StatelessWidget {
  final String title;
  final String dateText;
  final VoidCallback? onTap;
  const DisplayDatePickedComponent(
      {required this.title, required this.dateText, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.slate200,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          const Gap(20),
          Text(
            dateText,
            style: const TextStyle(
              color: AppColors.slate200,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              decorationColor: AppColors.slate300,
              fontSize: 18,
            ),
          ),
          const Gap(4),
          const Icon(
            PhosphorIcons.calendar_blank,
            size: 20,
            color: AppColors.slate100,
          ),
        ],
      ),
    );
  }
}
