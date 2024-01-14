import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/display_date_picked_component.dart';
import 'package:habit_manager/core/ui/components/input_text_form_field_component.dart';
import 'package:habit_manager/core/ui/components/main_button_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class CreateHabitScreen extends StatefulWidget {
  const CreateHabitScreen({super.key});

  @override
  State<CreateHabitScreen> createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends State<CreateHabitScreen> {
  final TextEditingController yourGoalController = TextEditingController();
  final TextEditingController habitNameController = TextEditingController();

  DateTime startDateSelected = DateTime.now();
  DateTime finalDateSelected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const Gap(50),
                  const Text(
                    'Criar Novo Habito',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const Gap(30),
                  SizedBox(
                    width: size.width * 0.9,
                    child: InputTextFormFieldComponent(
                      label: 'Seu Objetivo',
                      controller: yourGoalController,
                    ),
                  ),
                  const Gap(26),
                  SizedBox(
                    width: size.width * 0.9,
                    child: InputTextFormFieldComponent(
                      label: 'Nome Do Habito',
                      controller: habitNameController,
                    ),
                  ),
                  const Gap(60),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Escolha a frequencia',
                          style: TextStyle(
                            color: AppColors.slate200,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                        const Gap(2),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: size.width * 0.9,
                            height: 46,
                            decoration: BoxDecoration(
                              color: AppColors.slate900,
                              border: Border.all(
                                  color: AppColors.slate300, width: 1),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.slate300,
                                    offset: Offset(1, 2))
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Diariamente',
                                style: TextStyle(
                                  color: AppColors.slate200,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(50),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Defina o periodo',
                          style: TextStyle(
                            color: AppColors.slate200,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const Gap(20),
                        DisplayDatePickedComponent(
                          title: 'Data inicio:',
                          dateText:
                              '${startDateSelected.day}/${startDateSelected.month}/${startDateSelected.year}',
                          onTap: () async {
                            final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: startDateSelected,
                              firstDate: DateTime(DateTime.now().year),
                              lastDate: DateTime(2100),
                            );

                            if (dateTime != null) {
                              setState(() {
                                startDateSelected = dateTime;
                              });
                            }
                          },
                        ),
                        const Gap(8),
                        DisplayDatePickedComponent(
                          title: 'Data fim:    ',
                          dateText:
                              '${finalDateSelected.day}/${finalDateSelected.month}/${finalDateSelected.year}',
                          onTap: () async {
                            final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: finalDateSelected,
                              firstDate: DateTime(DateTime.now().year),
                              lastDate: DateTime(2100),
                            );

                            if (dateTime != null) {
                              setState(() {
                                finalDateSelected = dateTime;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const Gap(40),
                  MainButtonComponent(
                    title: 'Criar novo',
                    onPress: () {},
                  ),
                  const Gap(14),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: AppColors.slate400,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                        decorationColor: AppColors.slate400,
                        fontSize: 16,
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
