import 'package:coba_login/app_route/app_route.dart';
import 'package:coba_login/model/login/login.dart';
import 'package:coba_login/model/user/user.dart';
import 'package:coba_login/network/api_client.dart';

class LoginViewModel {
  String? message;

  Future<bool> tryLogin(
      String userID,
      String password) async {
    Login _login = new Login();
    _login = await ApiClient.login(userID: userID, password: password);
    if (_login.isSuccess()) {
      await User.setUserID(userID);
      await User.setToken(_login.token);
      AppRoute.navigator.pushReplacementNamed(
        AppRoute.homeRoute,
      );
    }
    message = _login.message;
    return _login.isSuccess();
  }

  Future<void> tryLogout() async {
    await User.clear();
    AppRoute.navigator.pushReplacementNamed(
      AppRoute.loginRoute,
    );
  }
}
