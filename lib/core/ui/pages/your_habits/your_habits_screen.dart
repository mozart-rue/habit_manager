import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/data/models/habit_model.dart';
import 'package:habit_manager/core/data/services/fetch_habits_service.dart';
import 'package:habit_manager/core/ui/components/animated_loading.dart';
import 'package:habit_manager/core/ui/components/habit_tile_component.dart';
import 'package:habit_manager/core/ui/components/something_went_wrong.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class YourHabitsScreen extends StatefulWidget {
  const YourHabitsScreen({super.key});

  @override
  State<YourHabitsScreen> createState() => _YourHabitsScreenState();
}

class _YourHabitsScreenState extends State<YourHabitsScreen> {
  bool isLoading = true;
  bool requestHasError = false;
  List<HabitModel> habits = [];

  Future<void> handleFetchHabits() async {
    var response = await fetchHabitsService();

    if (!response.succeeded) {
      requestHasError = true;
      isLoading = false;
      print('Error catched = ${response.error}');
      setState(() {});
      return;
    }

    habits = response.data!;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // Future(handleFetchHabits);
    Future( () async => await handleFetchHabits());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: size.width * 0.9,
              child: Column(
                children: [
                  const Gap(30),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          PhosphorIcons.arrow_left,
                          size: 28,
                          color: AppColors.slate200,
                        ),
                      ),
                      const Gap(20),
                      const Text(
                        'Seus Habitos',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  isLoading ? 
                  const AnimatedLoading()
                  : requestHasError
                  ? const SomethingWentWrong() 
                  : habits.isEmpty 
                  ? const Center(
                    child: Text(
                      'Você ainda não possui nenhum habito cadastrado',
                      style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                      ),
                    ),
                  )
                  : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: habits.length,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: const EdgeInsets.only(bottom: 6, top: 6),
                            child: HabitTileComponent(habit: habits[index],),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
