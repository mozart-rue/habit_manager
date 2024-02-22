import 'package:habit_manager/core/data/models/habit_model.dart';
import 'package:habit_manager/core/exceptions/unauthorized_exception.dart';
import 'package:habit_manager/core/helpers/api_urls_request.dart';
import 'package:habit_manager/core/helpers/global_variables.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;

Future<List<HabitModel>> fetchHabitsHttp() async {
  String apiUrl = ApiUrlsRequest.apiUrl;

  String? accessToken = GlobalVariables().accessToken;
  
  if (accessToken != null) {
    throw Exception('Error on fetchHabitsHttp :: token key is empty.');
  }

  var url = Uri.http(apiUrl, '/habits/fetchAll');

  var response = await http.get(
    url,
    headers: {
      'authentication': 'Bearer $accessToken',
    }
  );

  if (response.statusCode == 401) {
    throw UnauthorizedException();
  }

  if (response.statusCode != 200) {
    throw Exception('Error on request habits');
  }

  // json object machen
  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

  List<HabitModel> habits = [];

  for (var item in jsonResponse['habits']){
    HabitModel habit = HabitModel.fromJson(item);
    habits.add(habit);
  }

  return habits;
}
