import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/date_text_component.dart';

class DisplayCurrentDateComponent extends StatelessWidget {
  const DisplayCurrentDateComponent({super.key});

  static const List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String currentMonthName = months[today.month - 1];
    return Row(
      children: [
        DateTextComponent(
          title: today.day.toString(),
        ),
        const Gap(8),
        DateTextComponent(
          title: currentMonthName,
        ),
        const Gap(8),
        DateTextComponent(
          title: today.year.toString(),
        ),
      ],
    );
  }
}
