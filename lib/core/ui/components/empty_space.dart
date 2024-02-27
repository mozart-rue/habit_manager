import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class EmptySpace extends StatelessWidget {
  final String? message;
  const EmptySpace({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/planet.png',
          ),
          const Gap(2),
          Text(
            message ?? 'Você não possui nenhum habito cadastrado.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.slate400,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
