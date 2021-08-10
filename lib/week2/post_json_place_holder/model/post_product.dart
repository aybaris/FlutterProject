import 'dart:convert';

import 'package:flutter/services.dart';
class Product {
  final List<rowsList> rows;
  Product({
    required this.rows,
  });
  factory Product.fromJson(List<dynamic> parsedJson) {
    print("burasi");
    List<rowsList> rows = <rowsList>[];
    rows = parsedJson.map((i) => rowsList.fromJson(i)).toList();
    print("rows"+rows.length.toString());
    return new Product(
      rows: rows,
    );
  }
}
class rowsList {
  String? id;
  String referenceCode;
  String description;
  String imageData;
  rowsList({ this.id, required this.referenceCode, required this.description, required this.imageData});
  factory rowsList.fromJson(Map<String, dynamic> json) {
    print("mahmut"+json['uuid'],);
    return new rowsList(
     /*   id: json['CODE'],
        referenceCode: json['DESCRIPTION'],
        description: json['LOGICALREF'],
        imageData: json['LDATA'].toString().replaceAll('\n', ''));
*/
    id: json['uuid'],
    referenceCode: json['code'],
    description: json['name'] == null ? "UNDEFINEDNAME" :  json['name'],
     imageData: json["mainImage"] == null ? "" : json["mainImage"]['document'].toString().replaceAll('\n', ''));
  }
  Map<String, dynamic> toJson() {
    return {/*"_id": id, */"referenceCode": referenceCode, "description": description,"mainImage" "document": imageData}; } /*"barcode": barcode};*/


  Map<String, dynamic> toJsonWithId() {
    return {"_id": id, "referenceCode": referenceCode, "description": description, "imageData": imageData/*, "barcode": barcode*/};
  }

  @override
  String toString() {
    return 'Profile{_id: $id, referenceCode: $referenceCode, description: $description, imageData: $imageData }';/*barcode: $barcode*/
  }

}
//List<dynamic> jsonData
Product productFromJson(String jsonData) {

  //Product.fromJson(json.decode(jsonData));
  // final data = jsonData;
  final data = json.decode(jsonData);
//Product.fromJson(i)
  print("data"+data.length.toString());
  // return jsonData.map((i) => Product.fromJson(i)).toList();
  // data.map((i) => print("asd"+i));
  return Product.fromJson(data.map((item) { print("product from : "+Product.fromJson(item).toString());}));
}


String productToJson(rowsList data) {
  if(data.id == ""){

    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
  else {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}


/*class Product {
  String id;
  String referenceCode;
  String description;
  String imageData;
  //String barcode;

  Product({  required this.id,  required this.referenceCode,  required this.description, required this.imageData}); //, required this.barcode});

  factory Product.fromJson(Map<String, dynamic> json) {
    print("deneme   : ");

    return Product(
    id: json['data']['items']['uuid'],
    referenceCode: json['data']['items']['code'],
    description: json['data']['items']['name'],
    imageData: json['data']['items']["mainImages"]["items"]['document'],
   // barcode: json['barcode'],
        );

  }*/
