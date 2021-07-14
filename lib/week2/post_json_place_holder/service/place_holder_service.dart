

// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vs_code_flutter_demo/week2/core/enum/service_path_enum.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_product.dart';

import '../model/post_model.dart';

class PlaceHolderService {
  Future<List<Product>?> fetchPostItems() async {
    final getUrl = Uri.parse(
        '${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.GET.rawValue}');
    final response = await http.get(getUrl);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responsebody = jsonDecode(response.body);
        if (responsebody is List) {
          return responsebody.map((e) => Product.fromJson(e)).toList();
        }
        return [];
      default:
        return null;
    // throw Exception('Service error $response');
    }
  }


  Future<bool> createProduct(Product data) async {
    final postUrl = Uri.parse( "${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.POST}");

    final response = await http.post(
      postUrl,
      headers: {"content-type": "application/json"},
      body: productToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }



  Future<bool> updateProduct(Product data) async {
    final putUrl = Uri.parse( "${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.PUT}/${data.id}");
    final response = await http.put(
     putUrl,
      headers: {"content-type": "application/json"},
      body: productToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProduct(int id) async {
    final deleteUrl = Uri.parse( "${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.PUT}/${id}");
    final response = await http.delete(
      deleteUrl,
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
