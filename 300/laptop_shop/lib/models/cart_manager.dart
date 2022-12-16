import 'package:flutter/foundation.dart';

class CartManager extends ChangeNotifier {
  final List<String> _cartList = [];
  List<String> get cartList => _cartList;

  void addToCart(String productName) {
    _cartList.add(productName);
    notifyListeners();
  }

  void deleteCart(String productName) {
    _cartList.remove(productName);
    notifyListeners();
  }
}
