import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: Container(
        color: Colors.orange.withOpacity(0.5),
        padding: const EdgeInsets.all(16),
        child: Consumer<CartManager>(builder: (context, manager, child) {
          final cartList = manager.cartList;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        cartList[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever_rounded),
                        onPressed: () {
                          manager.deleteCart(cartList[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Buy',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
