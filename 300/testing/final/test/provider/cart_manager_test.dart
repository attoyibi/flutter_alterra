import 'package:flutter_test/flutter_test.dart';
import 'package:laptop_shop/models/cart_manager.dart';

void main() {
  group('Provider Test', () {
    // Arrange
    late CartManager cartManager;
    const mockNewCartItem = 'Mock Laptop Asus';

    setUp(() {
      cartManager = CartManager();
    });

    test('A new item should be added', () {
      // Act
      cartManager.addToCart(mockNewCartItem);
      // Assert
      final result = cartManager.cartList.contains(mockNewCartItem);
      expect(result, true);
    });
    test(
      'A selected item should be removed',
      () {
        // Act
        cartManager.deleteCart(mockNewCartItem);
        // Assert
        final result = cartManager.cartList.contains(mockNewCartItem);
        expect(result, false);
      },
    );
    // Test lainnya...
  });
}
