import 'package:flutter/material.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/account/account_screen.dart';
import 'package:habit_manager/core/ui/pages/auth/login_screen.dart';
import 'package:habit_manager/core/ui/pages/auth/sign_up_screen.dart';
import 'package:habit_manager/core/ui/pages/create_habit/create_habit_screen.dart';
import 'package:habit_manager/core/ui/pages/home/home_screen.dart';
import 'package:habit_manager/core/ui/pages/progress/progress_screen.dart';
import 'package:habit_manager/core/ui/pages/your_goals/your_goals_screen.dart';
import 'package:habit_manager/core/ui/pages/your_habits/your_habits_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
        '/progress': (context) => const ProgressScreen(),
        '/createHabit': (context) => const CreateHabitScreen(),
        '/your-habits': (context) => const YourHabitsScreen(),
        '/your-goals': (context) => const YourGoalsScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
