import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart' as dartz;
import 'package:fake_store_package/Models/Category.dart';
import 'package:fake_store_package/Models/Product.dart';
import 'package:fake_store_package/Models/User.dart';

class FakeStoreAPI {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<dartz.Either<String, Product>> fetchProduct(int id) async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return dartz.Right(Product.fromJson(jsonResponse));
      } else {
        return dartz.Left('Failed to load product');
      }
    } catch (e) {
      return dartz.Left('An error occurred: $e');
    }
  }

    Future<dartz.Either<String, List<Product>>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final products = jsonData.map((json) => Product.fromJson(json)).toList();
      return dartz.Right(products);
    } else {
      return dartz.Left('Failed to load products');
    }
  }

  Future<dartz.Either<String, List<Category>>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final categories = jsonData.map((json) => Category.fromJson({'name': json})).toList();
      return dartz.Right(categories);
    } else {
      return dartz.Left('Failed to load categories');
    }
  }

  Future<dartz.Either<String, List<User>>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final users = jsonData.map((json) => User.fromJson(json)).toList();
      return dartz.Right(users);
    } else {
      return dartz.Left('Failed to load users');
    }
  }
}