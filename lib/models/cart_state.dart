import 'package:flutter/material.dart';
import '../models/product.dart';

class CartState extends ChangeNotifier {
  final Map<String, int> _items = {};

  // Example products
  final List<Product> availableProducts = [
    Product(
      id: '1',
      name: 'Nuts Caramel',
      category: 'Donuts',
      brand: 'Dunkin\'s',
      price: 36,
      imageUrl: 'assets/images/donut_caramel.png',
      bgColor: const Color(0xFFE8F6F8),
      description:
          'The Sweet And Subtle Salty Combo Of Chocolate Meets Caramel.',
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
      category: 'Donuts',
      brand: 'Dunkin\'s',
      price: 45,
      imageUrl: 'assets/images/donut_redvelvet.png',
      bgColor: const Color(0xFFFDE8EA),
      description:
          'The Sweet And Subtle Salty Combo Of Chocolate Meets Caramel.',
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
      category: 'Donuts',
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
      category: 'Donuts',
      brand: 'Dunkin\'s',
      price: 95,
      imageUrl: 'assets/images/donut_choco.png',
      bgColor: const Color(0xFFFEEFE3),
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
    Product(
      id: '5',
      name: 'Classic Burger',
      category: 'Burger',
      brand: 'Burger King',
      price: 55,
      imageUrl: 'assets/images/burger_classic.png',
      bgColor: const Color(0xFFFEEFE3),
      description: 'Juicy beef patty with fresh lettuce and tomato.',
      ingredients: {
        'Protein': '15 Gram',
        'Salt': '12 Gram',
        'Fat': '20 Gram',
        'Energy': '350 Kcal',
        'Protein%': 0.30,
        'Salt%': 0.05,
        'Fat%': 0.35,
        'Energy%': 0.60,
      },
    ),
    Product(
      id: '6',
      name: 'Berry Smoothie',
      category: 'Smoothie',
      brand: 'Freshies',
      price: 40,
      imageUrl: 'assets/images/smoothie_berry.png',
      bgColor: const Color(0xFFE8F6F8),
      description: 'Refreshing mix of wild berries and ice.',
      ingredients: {
        'Sugar': '20 Gram',
        'Salt': '1 Gram',
        'Fat': '0 Gram',
        'Energy': '120 Kcal',
        'Sugar%': 0.10,
        'Salt%': 0.001,
        'Fat%': 0.0,
        'Energy%': 0.20,
      },
    ),
    Product(
      id: '7',
      name: 'Maple Pancake',
      category: 'PanCake',
      brand: 'IHOP',
      price: 60,
      imageUrl: 'assets/images/pancake_maple.png',
      bgColor: const Color(0xFFFEEFE3),
      description: 'Fluffy pancakes with rich maple syrup.',
      ingredients: {
        'Sugar': '25 Gram',
        'Salt': '4 Gram',
        'Fat': '15 Gram',
        'Energy': '280 Kcal',
        'Sugar%': 0.15,
        'Salt%': 0.02,
        'Fat%': 0.20,
        'Energy%': 0.45,
      },
    ),
    Product(
      id: '8',
      name: 'Pepperoni Pizza',
      category: 'Pizza',
      brand: 'Domino\'s',
      price: 120,
      imageUrl: 'assets/images/pizza_pepperoni.png',
      bgColor: const Color(0xFFFDE8EA),
      description: 'Cheesy pizza topped with spicy pepperoni slices.',
      ingredients: {
        'Protein': '12 Gram',
        'Salt': '8 Gram',
        'Fat': '22 Gram',
        'Energy': '400 Kcal',
        'Protein%': 0.25,
        'Salt%': 0.04,
        'Fat%': 0.40,
        'Energy%': 0.70,
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
