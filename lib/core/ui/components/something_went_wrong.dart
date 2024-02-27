import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class SomethingWentWrong extends StatelessWidget {
  final String? message;
  const SomethingWentWrong({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/wrong.png',
            color: AppColors.slate500,
          ),
          const Gap(8),
          Text(
            message ?? 'Parece que algo deu errado.',
            style: const TextStyle(
              color: AppColors.slate300,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
