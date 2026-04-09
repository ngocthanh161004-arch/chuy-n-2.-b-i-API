import 'package:flutter/material.dart';
import 'product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}