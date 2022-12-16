import 'package:flutter/material.dart';
import 'package:laptop_shop/models/cart_manager.dart';
import 'package:provider/provider.dart';

import 'screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Laptop Shop',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const ProductScreen(),
      ),
    );
  }
}
