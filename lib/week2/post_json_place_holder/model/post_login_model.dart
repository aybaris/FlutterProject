import 'dart:convert';

class LoginResponseModel{
  final String token;
  final bool success;
  
  LoginResponseModel({required this.token,required this.success});
  
  
  factory LoginResponseModel.fromJson(Map<String,dynamic> json){
    return LoginResponseModel(token:json['authToken'], success: json['success']);
  }


  List<LoginResponseModel> userFromJson(String jsonData) {
    //Product.fromJson(json.decode(jsonData));
    final data = json.decode(jsonData);
    return List<LoginResponseModel>.from(data.map((item) => LoginResponseModel.fromJson(item)));
  }
}





class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email,required this.password});

  Map<String,dynamic> toJson() {
    Map<String,dynamic> map = {
      'email': email.trim()
    };
    return map;
  }

}