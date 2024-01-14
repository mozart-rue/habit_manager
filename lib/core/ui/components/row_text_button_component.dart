import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class RowTextButtonComponent extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onTap;
  const RowTextButtonComponent(
      {required this.title, required this.content, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
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
            content,
            style: const TextStyle(
              color: AppColors.slate200,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const Gap(4),
          const Icon(
            PhosphorIcons.pencil_simple_line,
            size: 20,
            color: AppColors.slate100,
          ),
        ],
      ),
    );
  }
}
