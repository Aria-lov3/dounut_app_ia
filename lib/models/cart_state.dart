import 'package:flutter/material.dart';
import '../models/product.dart';

class CartState extends ChangeNotifier {
  final Map<String, int> _items = {};
  
  // Example products
  final List<Product> availableProducts = [
    Product(
      id: '1',
      name: 'Nuts Caramel',
      brand: 'Dunkin\'s',
      price: 36,
      imageUrl: 'assets/images/donut_caramel.png', // We'll need to add assets
      bgColor: const Color(0xFFE8F6F8), // cardBlue
      description: 'The Sweet And Subtle Salty Combo Of Chocolate Meets Caramel.',
      ingredients: {
        'Sugar': '8 Gram',
        'Salt': '8 Gram',
        'Fat': '8 Gram',
        'Energy': '140 Kcal',
        'Sugar%': 0.02,
        'Salt%': 0.003,
        'Fat%': 0.12,
        'Energy%': 0.40,
      },
    ),
    Product(
      id: '2',
      name: 'Red Velvet',
      brand: 'Dunkin\'s',
      price: 45,
      imageUrl: 'assets/images/donut_redvelvet.png',
      bgColor: const Color(0xFFFDE8EA), // cardPink
      description: 'The Sweet And Subtle Salty Combo Of Chocolate Meets Caramel.',
      ingredients: {
        'Sugar': '12 Gram',
        'Salt': '5 Gram',
        'Fat': '10 Gram',
        'Energy': '160 Kcal',
        'Sugar%': 0.03,
        'Salt%': 0.002,
        'Fat%': 0.15,
        'Energy%': 0.45,
      },
    ),
    Product(
      id: '3',
      name: 'Strawberry',
      brand: 'Dunkin\'s',
      price: 84,
      imageUrl: 'assets/images/donut_strawberry.png',
      bgColor: const Color(0xFFFDE8EA),
      description: 'Delicious strawberry frosted donut with sprinkles.',
      ingredients: {
        'Sugar': '15 Gram',
        'Salt': '6 Gram',
        'Fat': '12 Gram',
        'Energy': '180 Kcal',
        'Sugar%': 0.04,
        'Salt%': 0.002,
        'Fat%': 0.18,
        'Energy%': 0.50,
      },
    ),
    Product(
      id: '4',
      name: 'Choco Tap',
      brand: 'Dunkin\'s',
      price: 95,
      imageUrl: 'assets/images/donut_choco.png',
      bgColor: const Color(0xFFFEEFE3), // cardOrange
      description: 'Rich chocolate icing donut with a tap of sweetness.',
      ingredients: {
        'Sugar': '10 Gram',
        'Salt': '7 Gram',
        'Fat': '14 Gram',
        'Energy': '200 Kcal',
        'Sugar%': 0.025,
        'Salt%': 0.003,
        'Fat%': 0.20,
        'Energy%': 0.55,
      },
    ),
  ];

  Map<String, int> get items => _items;

  void addItem(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId] = _items[productId]! + 1;
    } else {
      _items[productId] = 1;
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    if (!_items.containsKey(productId)) return;
    
    if (_items[productId]! > 1) {
      _items[productId] = _items[productId]! - 1;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  int get itemCount {
    return _items.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double get totalPrice {
    double total = 0.0;
    _items.forEach((productId, quantity) {
      final product = availableProducts.firstWhere((p) => p.id == productId);
      total += product.price * quantity;
    });
    return total;
  }
}
