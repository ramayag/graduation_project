import 'package:gui/core/utils/enums.dart';
import 'package:gui/core/utils/styles.dart';
import 'package:gui/presentation/dashboard/dashboard_screen.dart';
import 'package:gui/presentation/login_singup/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gui/presentation/welcom/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Styles.themeData(false, context),
      home: WelcomeScreen(),
    //  LoginScreen(loginType: LoginType.signIn),
    );
  }
}
