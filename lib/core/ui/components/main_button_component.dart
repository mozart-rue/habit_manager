import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class MainButtonComponent extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color btnColor;
  final Color textColor;
  const MainButtonComponent(
      {required this.title,
      required this.onPress,
      this.btnColor = AppColors.blue,
      this.textColor = AppColors.slate200,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPress,
      child: Container(
        width: size.width * 0.6,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: btnColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
