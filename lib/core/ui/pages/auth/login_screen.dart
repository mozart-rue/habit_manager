import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/ui/components/go_to_text_component.dart';
import 'package:habit_manager/core/ui/components/input_text_form_field_component.dart';
import 'package:habit_manager/core/ui/components/main_button_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/auth/sign_up_screen.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';
import 'package:habit_manager/core/ui/pages/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool isWaitingForAuthenticate = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void setRememberMe(bool? value) {
    setState(() {
      rememberMe = value ?? false;
    });
  }

  void setWaitingForAuthenticate(bool value) {
    setState(() => isWaitingForAuthenticate = value);
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo Obrigatório!';
    }

    bool isValid = EmailValidator.validate(value);

    if (!isValid) {
      return 'E-mail inválido!';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo Obrigatório';
    }

    if (value.trim().length < 8) {
      return 'Minimo de 8 caracteres';
    }

    return null;
  }

  Future<bool> handleAuthentication() async {
    if (emailController.text == 'meu@mail.com' &&
        passwordController.text == 'minhasenha123') {
      await Future.delayed(const Duration(seconds: 3));
      return true;
    }

    await Future.delayed(const Duration(seconds: 3));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
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
                      'Entrar',
                      style: TextStyle(
                        color: AppColors.slate100,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GoToTextComponent(
                      title: 'Cadastrar-se',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                      },
                    ),
                  ],
                ),
                Gap(size.height * 0.16),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: Column(
                      children: [
                        InputTextFormFieldComponent(
                          label: 'Email',
                          controller: emailController,
                          validate: validateEmail,
                        ),
                        const Gap(32),
                        InputTextFormFieldComponent(
                          label: 'Senha',
                          controller: passwordController,
                          validate: validatePassword,
                        ),
                        Gap(size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: rememberMe,
                                  onChanged: setRememberMe,
                                ),
                                const Text(
                                  'Lembre me',
                                  style: TextStyle(
                                    color: AppColors.slate100,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: AppColors.blue,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Gap(size.height * 0.1),
                        MainButtonComponent(
                          title: isWaitingForAuthenticate ? 'load' : 'Entrar',
                          isLoading: isWaitingForAuthenticate,
                          onPress: () {
                            bool isFormValid =
                                _formKey.currentState!.validate();

                            if (isFormValid) {
                              handleAuthentication().then((value) {
                                if (value) {
                                  setWaitingForAuthenticate(false);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                                }
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
