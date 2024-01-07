import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';

class InputTextFormFieldComponent extends StatelessWidget {
  final String label;
  final String? Function(String? value)? validate;
  final TextEditingController? controller;
  const InputTextFormFieldComponent(
      {required this.label, this.validate, this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: validate,
          controller: controller,
          style: const TextStyle(
            color: AppColors.slate200,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: label,
            labelStyle: const TextStyle(
              color: AppColors.slate100,
              fontSize: 18,
            ),
            floatingLabelStyle: const TextStyle(
              color: AppColors.blue,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
