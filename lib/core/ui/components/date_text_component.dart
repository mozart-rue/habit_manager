import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class DateTextComponent extends StatelessWidget {
  final String title;
  final Color textColor;
  const DateTextComponent({
    required this.title,
    this.textColor = AppColors.slate300,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
