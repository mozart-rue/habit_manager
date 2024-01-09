import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/components/go_to_text_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class HeaderDisplayTopItensComponent extends StatelessWidget {
  final String title;
  final VoidCallback onTapSeeAll;
  final List<Widget> children;
  const HeaderDisplayTopItensComponent({
    required this.title,
    required this.onTapSeeAll,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.slate800,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.slate100,
                  ),
                ),
                GoToTextComponent(
                  title: 'Ver todos',
                  enableIcon: false,
                  fontSize: 14,
                  onTap: onTapSeeAll,
                ),
              ],
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
