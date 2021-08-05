

// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vs_code_flutter_demo/week2/core/enum/service_path_enum.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_product.dart';

import '../model/post_model.dart';

class PlaceHolderService {
  Future<List<Product>?> fetchPostItems() async {
    final getUrl = Uri.parse(
        '${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.GET.rawValue}');
    final response = await http.get(getUrl);

    return productFromJson(response.body);
  }


  Future<http.Response> createProduct(Product data) async {
    final postUrl = Uri.parse(
        '${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.POST.rawValue}');


    final response = await http.post(
      postUrl,
      headers: {"content-type": "application/json"},
      body: productToJson(data),
    );
    return response;
  }


  Future<bool> updateProduct(Product data) async {
    final putUrl = Uri.parse(
        '${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.PUT.rawValue}/${data
            .id}');
    final response = await http.put(
      putUrl,
      headers: {"content-type": "application/json"},
      body: productToJson(data),
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProduct(Product data) async {
    final deleteUrl = Uri.parse(
        '${ServicePathEnum.BASE_URL.rawValue}${ServicePathEnum.DELETE.rawValue}/${data.id}');
    final response = await http.delete(
      deleteUrl,
      headers: {"content-type": "application/json"},

    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}