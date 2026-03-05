import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String imageUrl;
  final Color bgColor;
  final String description;
  final Map<String, dynamic> ingredients;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
    required this.bgColor,
    required this.description,
    required this.ingredients,
  });
}
