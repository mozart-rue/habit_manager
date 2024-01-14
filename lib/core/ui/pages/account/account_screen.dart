import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/account_options_container.dart';
import 'package:habit_manager/core/ui/components/bottom_navigation_bar_icon.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';
import 'package:habit_manager/core/ui/pages/my_account/my_account_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarIcon(currentIndex: 0),
      body: AppBackgroundScreen(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Gap(30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(12),
                    Text(
                      'Configurações',
                      style: TextStyle(
                        color: AppColors.slate200,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                AccountOptionsContainer(
                  title: 'Minha conta',
                  width: size.width * 0.9,
                  onTap: () {
                    Navigator.of(context).pushNamed('/my-account');
                  },
                ),
                AccountOptionsContainer(
                  title: 'Termos e condições',
                  width: size.width * 0.9,
                  onTap: () {},
                ),
                AccountOptionsContainer(
                  title: 'Politicas de uso',
                  width: size.width * 0.9,
                  onTap: () {},
                ),
                AccountOptionsContainer(
                  title: 'Sobre o app',
                  width: size.width * 0.9,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
