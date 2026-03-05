import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../models/product.dart';
import '../models/cart_state.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  // Helper to determine price tag color based on background
  Color _getPriceColor(Color bg) {
    if (bg == AppColors.cardBlue) return AppColors.priceBlue;
    if (bg == AppColors.cardPink) return AppColors.pricePink;
    return AppColors.priceOrange;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: product.bgColor,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Emulated Product Image since we don't have real assets yet
                // Later changed to Image.asset
                Expanded(
                  child: Center(
                    child: Icon(
                      Icons.donut_large,
                      size: 80,
                      color: _getPriceColor(product.bgColor).withOpacity(0.8),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  product.brand,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
            // Price Tag Top Right
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  '\$${product.price.toInt()}',
                  style: TextStyle(
                    color: _getPriceColor(product.bgColor),
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            // Bottom Row (Favorite and Add)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: AppColors.textMain.withOpacity(0.6),
                    size: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CartState>().addItem(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name} added to cart!'),
                          duration: const Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
