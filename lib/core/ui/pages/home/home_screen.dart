import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:gap/gap.dart';
import 'package:habit_manager/core/data/models/habit_model.dart';
import 'package:habit_manager/core/data/services/fetch_habits_service.dart';
import 'package:habit_manager/core/ui/components/bottom_navigation_bar_icon.dart';
import 'package:habit_manager/core/ui/components/display_current_date_component.dart';
import 'package:habit_manager/core/ui/components/goal_tile_component.dart';
import 'package:habit_manager/core/ui/components/habit_circular_progress_component.dart';
import 'package:habit_manager/core/ui/components/habit_tile_component.dart';
import 'package:habit_manager/core/ui/components/header_display_top_itens_component.dart';
import 'package:habit_manager/core/ui/consts/app_colors.dart';
import 'package:habit_manager/core/ui/pages/background/background_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading = true;
  late List<HabitModel> habits;
  bool requestHasError = false;

  Future<void> handleFetchHabits() async {
    var response = await fetchHabitsService();

    if (!response.succeeded) {
      requestHasError = true;
      setState(() {});
      return;
    }

    habits = response.data!;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    Future(handleFetchHabits);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String userName = 'User';
    int totalDailyHabits = 6;
    int dailyHabitsDone = 2;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarIcon(currentIndex: 1),
      body: AppBackgroundScreen(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const DisplayCurrentDateComponent(),
                  const Gap(8),
                  Row(
                    children: [
                      const Text(
                        'Olá, ',
                        style: TextStyle(
                          color: AppColors.slate100,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                          color: AppColors.blue,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Container(
                    width: size.width * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.blue,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.blue,
                          AppColors.lightBlue,
                          AppColors.lightestBlue,
                        ],
                        stops: [0.20, 0.45, 0.75],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const HabitCircularProgressComponent(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$dailyHabitsDone de $totalDailyHabits Habitos',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.slate100,
                                ),
                              ),
                              const Text(
                                'concluídos hoje',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.slate100,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(30),
                  HeaderDisplayTopItensComponent(
                    title: 'Habitos do dia',
                    onTapSeeAll: () {
                      Navigator.of(context).pushNamed('/your-habits');
                    },
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: habits.length,
                          itemBuilder: (context, index) {
                            if (isLoading) {
                              return const Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            if (habits.isEmpty) {
                              return const Center(
                                child: Text(
                                  'Pelo visto você ainda não possui nada cadastrado.',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: HabitTileComponent(habit: habits[index],),
                            );
                          }),
                    ],
                  ),
                  const Gap(24),
                  HeaderDisplayTopItensComponent(
                    title: 'Seus Objetivos',
                    onTapSeeAll: () {
                      Navigator.of(context).pushNamed('/your-goals');
                    },
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: GoalTileComponent(habit: habits[index],),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/createHabit');
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.slate900, width: 4),
            gradient: const LinearGradient(
              colors: [
                AppColors.blue,
                AppColors.lightBlue,
                AppColors.lightestBlue,
              ],
              stops: [0.20, 0.45, 0.75],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                PhosphorIcons.plus,
                color: AppColors.slate100,
                size: 36,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
