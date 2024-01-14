import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class AccountOptionsContainer extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double width;
  const AccountOptionsContainer(
      {required this.title, this.onTap, this.width = 200, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.slate800),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.slate100,
                  ),
                ),
                const Icon(
                  PhosphorIcons.caret_right,
                  color: AppColors.slate100,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
