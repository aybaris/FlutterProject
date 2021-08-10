import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/app.dart';
import 'package:vs_code_flutter_demo/week2/core/components/card/post_information_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
