import 'package:coba_login/app_route/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get the app routes
    return MaterialApp(
      navigatorKey: AppRoute.navigatorKey,
      routes: AppRoute.routes,
    );
  }
}


