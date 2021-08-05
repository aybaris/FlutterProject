import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/ui/home/home_screen.dart';
import 'package:vs_code_flutter_demo/week2/ui/home/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
