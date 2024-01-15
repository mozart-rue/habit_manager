import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CouterHabitsProgressText extends StatelessWidget {
  final String content;
  final Color color;
  final IconData icon;
  const CouterHabitsProgressText(
      {required this.content,
      required this.color,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const Gap(4),
        Text(
          content,
          style: TextStyle(
            color: color,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
