import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class GoToTextComponent extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const GoToTextComponent(
      {required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Gap(4),
          const Icon(
            PhosphorIcons.caret_right,
            color: AppColors.blue,
            size: 16,
          ),
        ],
      ),
    );
  }
}
