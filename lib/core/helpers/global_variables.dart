class GlobalVariables {
  static GlobalVariables? _instance;

  GlobalVariables._internal();

  factory GlobalVariables() {
    return _instance ??= GlobalVariables._internal();
  }

  String? accessToken;
}
