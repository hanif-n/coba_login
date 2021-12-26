import 'package:coba_login/view/home_page/home_page.dart';
import 'package:coba_login/view/login_page/login_page.dart';
import 'package:flutter/widgets.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  static NavigatorState get navigator => navigatorKey.currentState!;

  // This is for application routes
  static const String loginRoute = '/';
  static const String homeRoute = '/home';
  
  // Map the routes here
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    loginRoute: (_) => LoginPage(),
    homeRoute: (_) => HomePage(),
  };
}
