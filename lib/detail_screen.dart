import 'package:flutter/material.dart';
import 'product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chi tiết sản phẩm")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.thumbnail),
            SizedBox(height: 10),

            Text(
              product.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text(
              "${product.price} \$",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),

            SizedBox(height: 10),

            Text(product.description),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Đã thêm vào giỏ hàng")),
                );
              },
              child: Text("Thêm vào giỏ"),
            )
          ],
        ),
      ),
    );
  }
}