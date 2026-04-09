import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';

Future<List<Product>> fetchProducts() async {
  final response =
  await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List list = data['products'];
    return list.map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception("Lỗi API");
  }
}