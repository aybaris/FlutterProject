import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/core/components/scroll/scroll_bar_single.dart';
import 'package:vs_code_flutter_demo/week2/statefull/model/user.dart';

class HomeDetailStateless extends StatelessWidget {
  final User model;

  const HomeDetailStateless({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text(model.title)),
      body: ScrollBarSingle(
          child: Text(model
              .storyText)), //içerisinde gelen item scrollama ihityacı varsa scroollama çzellii katıyor
    ));
  }
}
