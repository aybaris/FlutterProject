import 'dart:convert';

class Product {


  int? id;
  String? name;
  int? age;
  String? colour;


  Product({ this.id, this.name, this.age, this.colour});


  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
        id: map["id"], name: map["name"], age: map["age"], colour: map["colour"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "age": age, "colour": colour};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, age: $age, colour: $colour}';
  }
}


List<Product> productFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Product>.from(data.map((item) => Product.fromJson(item)));
}

String productToJson(Product data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}