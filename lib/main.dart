import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:fake_store_package/API/fakestore_api.dart';
import 'package:fake_store_package/Models/Product.dart';
import 'package:fake_store_package/Models/User.dart';
import 'package:fake_store_package/Models/Category.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final FakeStoreAPI apiClient = FakeStoreAPI();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fake Store Products'),
        ),
        body: FutureBuilder<dartz.Either<String, List<Product>>>(
          future: apiClient.fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              dartz.Either<String, List<Product>> result = snapshot.data!;
              return result.fold(
                (error) => Center(child: Text('Error: $error')),
                (products) => ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(products[index].title),
                      subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}