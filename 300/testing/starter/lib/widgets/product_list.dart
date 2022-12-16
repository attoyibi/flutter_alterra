import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_manager.dart';
import '../models/products.dart';
import 'product_cards.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> productList = Product().productList;
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.orange.withOpacity(0.5),
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Consumer<CartManager>(
            builder: (context, CartManager item, widget) {
              return ProductCards(
                productName: productList[index],
                isAdded: item.cartList.contains(productList[index]),
                onTap: () {
                  item.addToCart(productList[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
