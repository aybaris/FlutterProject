import 'dart:convert';

import 'package:flutter/services.dart';

class Product {
  String id;
  String referenceCode;
  String description;
  String imageData;
  String barcode;

  Product({ required this.id,  required this.referenceCode,  required this.description, required this.imageData , required this.barcode});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
    id: json['_id'],
    referenceCode: json['referenceCode'],
    description: json['description'],
    imageData: json['imageData'],
    barcode: json['barcode'],);

  }

  Map<String, dynamic> toJson() {
    return {/*"_id": id, */"referenceCode": referenceCode, "description": description, "imageData": imageData, "barcode": barcode};
  }

  Map<String, dynamic> toJsonWithId() {
    return {"_id": id, "referenceCode": referenceCode, "description": description, "imageData": imageData, "barcode": barcode};
  }

  @override
  String toString() {
    return 'Profile{_id: $id, referenceCode: $referenceCode, description: $description, imageData: $imageData, barcode: $barcode}';
  }
}

List<Product> productFromJson(String jsonData) {
  //Product.fromJson(json.decode(jsonData));
   final data = json.decode(jsonData);
   return List<Product>.from(data.map((item) => Product.fromJson(item)));
}


String productToJson(Product data) {
  if(data.id == ""){

    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
  else {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
