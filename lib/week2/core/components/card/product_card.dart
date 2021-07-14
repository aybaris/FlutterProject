import 'package:flutter/material.dart';
import 'package:vs_code_flutter_demo/week2/core/components/card/post_information_card.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_product.dart';

import '../../../post_json_place_holder/model/post_model.dart';
import '../../../post_json_place_holder/model/post_product.dart';

class ProductCard extends StatefulWidget {
  final Product? model;

  const ProductCard({Key? key, required this.model}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isTouch = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isTouch ? Colors.yellow : Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InformationDataScreen()));
        },
        leading: CircleAvatar(
          child: buildText(),
        ),
        title: Text(widget.model?.name ?? ""),
      ),
    );
  }

  Widget buildText() {
    if (widget.model?.id != null) {
      return Text(widget.model?.age.toString() ?? "");
    }

    return FlutterLogo();
  }
}
