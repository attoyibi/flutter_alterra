import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:laptop_shop/main.dart' as app;

void main() {
  group('Testing full app flow', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('App widget flow from product to cart screen', (tester) async {
      // 1
      app.main();
      // 2
      await tester.pumpAndSettle();
      // 3
      final gridView = find.byType(GridView);
      expect(gridView, findsOneWidget);
      expect(find.text('Laptop Asus'), findsOneWidget);
      // 4
      final productList = [
        'Laptop Asus',
        'Laptop Dell',
        'Laptop Macbook',
        'Laptop Lenovo',
        'Laptop Hp',
        'Laptop Toshiba',
        'Laptop Acer',
        'Laptop Xiomi',
      ];
      // 5
      for (var key in productList) {
        await tester.tap(find.byKey(Key(key)));
      }
      // 6
      await tester.tap(find.byTooltip('cart_screen_button'));
      // 7
      await tester.pumpAndSettle();
      // 8
      final listview = find.byType(ListView);
      expect(listview, findsOneWidget);
      expect(find.text('Laptop Xiomi'), findsOneWidget);
    });
  });
}
