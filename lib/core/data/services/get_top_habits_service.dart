import 'package:habit_manager/core/data/http/get_top_habits_http.dart';
import 'package:habit_manager/core/data/models/habit_model.dart';
import 'package:habit_manager/core/data/models/return_data.dart';
import 'package:habit_manager/core/exceptions/unauthorized_exception.dart';

Future<ReturnData<List<HabitModel>>> getTopHabitsService() async {
  try {
    List<HabitModel> habits = await getTopHabitsHttp();
    return ReturnData(
      succeeded: true,
      data: habits,
    );
  } catch (e) {
    if (e is UnauthorizedException) {
      // recria token e tenta novamente
    }
    return ReturnData(
      succeeded: false,
      error: Exception("Error on request getTopHabits => $e"),
    );
  }
}
