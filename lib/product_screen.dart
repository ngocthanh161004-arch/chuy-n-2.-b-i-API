import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product.dart';
import 'detail_screen.dart';

class ProductScreen extends StatelessWidget {
  final Future<List<Product>> products = fetchProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sách sản phẩm")),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final p = data[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(product: p),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(p.thumbnail, width: 50),
                    title: Text(p.title),
                    subtitle: Text("${p.price} \$"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}