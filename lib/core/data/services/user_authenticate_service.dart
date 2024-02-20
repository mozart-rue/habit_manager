
import 'package:habit_manager/core/data/http/authenticate_user_http.dart';
import 'package:habit_manager/core/exceptions/invalid_credential_exception.dart';
import 'package:habit_manager/core/helpers/global_variables.dart';

Future<String> userAuthenticateService({required String email, required String password}) async {
  try {
    String token = await authenticateUserHttp(email: email, password: password);

    GlobalVariables variables = GlobalVariables();
    variables.accessToken = token;
    
    return token;
  }
  catch (e) {
    if (e is InvalidCredentialException) {
      print("erro na authenticação $e");
      throw e;
    }
    print("erro na request $e");
    throw e;
  }
}
