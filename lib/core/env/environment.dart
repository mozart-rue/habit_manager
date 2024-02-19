import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Environment? _instance;
  late String _apiUrl;

  Environment._internal() {
    // valida variaveis de ambiente
    if (!dotenv.env.containsKey('APIURL')) {
      throw Exception('Váriavel de ambiente "APIURL" está faltando no dotenv.');
    }

    if (dotenv.env['APIURL'].runtimeType != String) {
      throw Exception('Váriavel de ambiente "APIURL" está com tipo errado => type of APIURL = ${dotenv.env["APIURL"].runtimeType}.');
    }

    _apiUrl = dotenv.env['APIURL']!;
  }

  factory Environment() {
    return _instance ??= Environment._internal();
  }
  
  String get apiUrl => _apiUrl;
}
