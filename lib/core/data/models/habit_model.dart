class HabitModel {
   final String id;
   final String goalName;
   final String habitName;
   final String userId;
   final bool done;
   final String frequency;
   final String periodStart;
   final String periodEnd;
   final DateTime createdAt;
   final List<Map<String, dynamic>> historic;

  HabitModel({
    required this.id,
    required this.goalName,
    required this.habitName,
    required this.userId,
    required this.done,
    required this.frequency,
    required this.periodStart,
    required this.periodEnd,
    required this.createdAt,
    required this.historic,
  });

  factory HabitModel.fromJson(Map<String, dynamic> data){
    return HabitModel(
      id: data['id'],
      goalName: data['goal_name'],
      habitName: data['habit_name'],
      userId: data['user_id'],
      done: data['done'],
      frequency: data['frequency'],
      periodStart: data['period_start'],
      periodEnd: data['period_end'],
      createdAt: data['created_at'],
      historic: data['historic'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      "goal_name": goalName,
      "habit_name": habitName,
      "frequency": frequency,
      "period_start": periodStart,
      "period_end": periodEnd,
    };
  }
}
