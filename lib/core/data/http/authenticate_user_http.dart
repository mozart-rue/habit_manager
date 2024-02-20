import "dart:convert" as convert;

import "package:habit_manager/core/exceptions/invalid_credential_exception.dart";
import "package:habit_manager/core/helpers/api_urls_request.dart";
import "package:http/http.dart" as http;

Future<String> authenticateUserHttp({required String email, required password}) async {
  String apiUrl = ApiUrlsRequest.apiUrl;
  var url = Uri.http(apiUrl, '/user/login');

  var response = await http.post(
    url,
    body: {
      'email': email,
      'password': password,
    }
  );

  if (response.statusCode == 400) {
    throw InvalidCredentialException();
  }

  if (response.statusCode != 200) {
    print("Erro na requisição => ${response.statusCode} => ${response.body}");
    throw Exception();
  }

  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

  return jsonResponse['token'];
}
