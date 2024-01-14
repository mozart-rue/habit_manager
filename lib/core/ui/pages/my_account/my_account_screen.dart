import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/bottom_navigation_bar_icon.dart';
import 'package:habit_manager/core/ui/components/row_text_button_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarIcon(currentIndex: 0),
      body: AppBackgroundScreen(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Minha Conta',
                        style: TextStyle(
                          color: AppColors.slate200,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  RowTextButtonComponent(
                    title: 'Nome:',
                    content: 'Mozart',
                    onTap: () {},
                  ),
                  const Gap(16),
                  RowTextButtonComponent(
                    title: 'Email:',
                    content: 'meu@mail.com',
                    onTap: () {},
                  ),
                  const Gap(20),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Alterar senha',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Gap(30),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sair',
                      style: TextStyle(
                        color: AppColors.red700,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
