import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class FrequencyPickerScreen extends StatelessWidget {
  const FrequencyPickerScreen({super.key});

  static const List<String> frequencies = [
    'Diariamente',
    'Uma vez por semana',
    'Duas vezes por semana',
    'Uma vez por mês',
    'Uma vez por trimestre'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        PhosphorIcons.x_circle,
                        size: 32,
                        color: AppColors.slate200,
                      ),
                    ),
                    const Gap(12),
                  ],
                ),
                const Text(
                  'Escolha a frequencia',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                const Gap(40),
                SizedBox(
                  width: size.width * 0.9,
                  child: ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      itemCount: frequencies.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop(frequencies[index]);
                            },
                            child: Container(
                              height: 46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: AppColors.slate700)),
                              child: Center(
                                child: Text(
                                  frequencies[index],
                                  style: const TextStyle(
                                    color: AppColors.slate200,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
