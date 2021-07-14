/*
import 'dart:convert';
import 'package:http/http.dart';
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_product.dart';

class ApiService{
  final String apiUrl = "https://crudcrud.com/api";
  
  Future <List<Product>> getProduct() async {
    Response res = await get(apiUrl);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Product> product = body.map((dynamic item) => Product.fromJson(item)).toList();
      return product;
    }else{
      throw "Listeyi yüklerken hata olustu" ;
    }
    
  }

}*/