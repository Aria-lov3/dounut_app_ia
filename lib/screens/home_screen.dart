import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../models/cart_state.dart';
import '../widgets/category_selector.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Donuts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Custom AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, size: 28),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: const Icon(Icons.person_outline),
                      ),
                    ],
                  ),
                ),

                // Greeting Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text.rich(
                    TextSpan(
                      text: 'I want to ',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        TextSpan(
                          text: 'Eat',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Categories
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CategorySelector(
                    selectedCategory: selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Products Grid
                Expanded(
                  child: Consumer<CartState>(
                    builder: (context, cartState, child) {
                      final filteredProducts = cartState.availableProducts
                          .where(
                            (product) => product.category == selectedCategory,
                          )
                          .toList();

                      return GridView.builder(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          bottom: 100,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: filteredProducts[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),

            // Bottom Sticky Cart
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomCartSummary(),
            ),
          ],
        ),
      ),
    );
  }
}
