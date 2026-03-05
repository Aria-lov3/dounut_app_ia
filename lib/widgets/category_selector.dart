import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'name': 'Donuts', 'icon': Icons.donut_small},
    {'name': 'Burger', 'icon': Icons.lunch_dining},
    {'name': 'Smoothie', 'icon': Icons.local_drink},
    {'name': 'PanCake', 'icon': Icons.cake},
    {'name': 'Pizza', 'icon': Icons.local_pizza},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 24, left: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.black87 : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ]
                          : [],
                    ),
                    child: Icon(
                      categories[index]['icon'],
                      size: 30,
                      color: isSelected ? Colors.black87 : Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    categories[index]['name'],
                    style: TextStyle(
                      color: isSelected ? Colors.black87 : Colors.grey.shade500,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
