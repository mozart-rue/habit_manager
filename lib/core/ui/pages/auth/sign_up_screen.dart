import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/go_to_text_component.dart';
import 'package:habit_manager/core/ui/components/input_text_form_field_component.dart';
import 'package:habit_manager/core/ui/components/main_button_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/auth/login_screen.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';
import 'package:validatorless/validatorless.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      // valid to create account
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBackgroundScreen(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Gap(size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: AppColors.slate100,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GoToTextComponent(
                    title: 'Entrar',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                  ),
                ],
              ),
              Gap(size.height * 0.08),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: size.width * 0.8,
                  child: Column(
                    children: [
                      InputTextFormFieldComponent(
                        label: 'Nome',
                        validate: Validatorless.multiple([
                          Validatorless.required('O campo é obrigatório.'),
                        ]),
                      ),
                      const Gap(32),
                      InputTextFormFieldComponent(
                        label: 'Email',
                        validate: Validatorless.multiple([
                          Validatorless.required('O campo é obrigatório.'),
                          Validatorless.email('Insira um email válido.')
                        ]),
                      ),
                      const Gap(32),
                      InputTextFormFieldComponent(
                        label: 'Senha',
                        validate: Validatorless.multiple([
                          Validatorless.required('O campo é obrigatório'),
                          Validatorless.min(
                              8, 'A senha deve possuir 8 caracteres no mínimo.')
                        ]),
                      ),
                      const Gap(32),
                      InputTextFormFieldComponent(
                        label: 'Confirma a senha',
                        validate: Validatorless.multiple([
                          Validatorless.required('O campo é obrigatório'),
                          Validatorless.min(
                              8, 'A senha deve possuir 8 caracteres no mínimo.')
                        ]),
                      ),
                      Gap(size.height * 0.1),
                      MainButtonComponent(
                        title: 'Cadastrar',
                        onPress: validateForm,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
