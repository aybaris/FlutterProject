import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/core/components/card/post_information_card.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/post_json_place_holder.dart';
import 'package:vs_code_flutter_demo/week2/statefull/home_statefull_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: PostJsonPlaceHolder(),
    );
  }
}
