
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vs_code_flutter_demo/week2/post_json_place_holder/model/post_login_model.dart';

class ApiService{
    Future<LoginResponseModel> login(String email, String password) async{
      String url = "https://jptest.diyalogo.com.tr/logo/restservices/rest/login";
      List<int> list = '$email:$password:61:61:TRTR'.codeUnits ;
      final response = await http.post(Uri.parse(url),
       headers: {
        HttpHeaders.authorizationHeader : 'BASIC '+base64Encode(list) ,
         "Content-Type": "application/json",
       }
      );

      if(response.statusCode ==200 || response.statusCode == 400){
        return LoginResponseModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('Veri yüklenirken hata oluştu');
      }
    }
    
  }

