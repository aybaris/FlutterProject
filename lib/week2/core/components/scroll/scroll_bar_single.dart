import 'package:flutter/material.dart';

class ScrollBarSingle extends StatelessWidget {
  // stateless dememizin sebebi sayfa sadece işlem yapypı içindekini gösterecek
  final Widget child;

  const ScrollBarSingle({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: SingleChildScrollView(child: child));
  }
}
