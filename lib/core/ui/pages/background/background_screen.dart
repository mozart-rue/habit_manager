import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class AppBackgroundScreen extends StatelessWidget {
  final Widget child;
  const AppBackgroundScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: AppColors.slate900,
        ),
        child,
      ],
    );
  }
}
