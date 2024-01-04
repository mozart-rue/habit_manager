import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundScreen(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Gap(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Sign up',
                    style: TextStyle(
                      color: AppColors.emerald700,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              const Gap(26),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                    const Gap(6),
                    TextFormField(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
