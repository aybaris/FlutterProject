

// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vs_code_flutter_demo/week2/core/enum/service_path_enum.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_product.dart';

import '../model/post_model.dart';

class PlaceHolderService {
  Future<Product> fetchPostItems(String token) async {
    final getUrl = Uri.parse(
        'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges?offset=0&limit=100&direction=desc&expandlevel=25');
    List<int> list = '61:$token:INTERNALUSER'.codeUnits ;
    final response = await http.get(
        getUrl,
      headers: {
        "content-type": "application/json",
        "Auth-Token": base64Encode(list) ,
      },
    );
    print("fetch işlemi statuscode :"+response.statusCode.toString());
    final responseJson = json.decode(utf8.decode(response.bodyBytes))["data"]['items'];
    //print("denemee123 :"+responseJson);
    return Product.fromJson(responseJson);
  }


  Future<http.Response> createProduct(String description, String referenceCode, String imageData, String tempToken ) async {
    final postUrl = Uri.parse(
        'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges/');
    print("description : "+description);

    List<int> list = "61:$tempToken:INTERNALUSER".codeUnits;
    var addJson = json.decode("{"
        "\"data\": {"
        "\"code\": \"$referenceCode\","
        "\"name\": \"$description\","
        "\"mainImage\": {"
        "\"document\": \"${imageData.toString()}\","
        "\"items\": []"
        "}"
        "}"
        "}");


    final response = await http.post(
      postUrl,
      headers: {
        'content-type': 'application/json',
        'Auth-Token': base64Encode(list) ,
      },
     body: json.encode(addJson['data']),
    );
    print("response code of create : "+response.statusCode.toString());
    return response;
  }

  Future<bool> updateProduct(String id,String tempToken,String referenceCode, String description,String imageData,) async {
    final putUrl = Uri.parse(
        'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges/$id?expandlevel=25');
    List<int> list = "61:$tempToken:INTERNALUSER".codeUnits;

    var firstUpdateJson = json.decode("{"
        "\"data\": {"
        "\"code\": \"${null}\","
        "\"name\": \"${null}\","
        "\"mainImage\": {"
        "\"document\": \"${null}\","
        "\"items\": []"
        "}"
        "}"
        "}"
    );

    final firsUpdate = await http.put(
      putUrl,
      headers: {
        'content-type': 'application/json',
        'Auth-Token': base64Encode(list)
      },
      body: json.encode(firstUpdateJson['data']),
    );

    var updateJson = json.decode("{"
        "\"data\": {"
        "\"code\": \"$referenceCode\","
        "\"name\": \"$description\","
        "\"mainImage\": {"
        "\"document\": \"${imageData.toString()}\","
        "\"items\": []"
        "}"
        "}"
        "}");

    final response = await http.put(
      putUrl,
      headers: {
        'content-type': 'application/json',
        'Auth-Token': base64Encode(list) ,
      },
      body: json.encode(updateJson['data']),
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteProduct(String id, String tempToken) async {
    final deleteUrl = Uri.parse(
        'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges/$id');

    List<int> list = "61:$tempToken:INTERNALUSER".codeUnits;
    final response = await http.delete(
      deleteUrl,
      headers: {"content-type": "application/json", 'Auth-Token': base64Encode(list) ,},

    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}