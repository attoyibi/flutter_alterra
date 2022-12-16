import 'package:flutter/material.dart';

class ProductCards extends StatelessWidget {
  const ProductCards(
      {super.key,
      required this.productName,
      required this.isAdded,
      required this.onTap});

  final String productName;
  final bool isAdded;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              'https://picsum.photos/id/0/400/300',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      productName,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    key: Key(productName),
                    onPressed: onTap,
                    icon: isAdded
                        ? Icon(
                            Icons.shopping_cart,
                            color: Colors.yellow[900],
                          )
                        : const Icon(
                            Icons.shopping_cart,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
