import 'package:flutter/material.dart';

class CategoriesHomepage extends StatefulWidget {
  @override
  State<CategoriesHomepage> createState() => _CategoriesHomepageState();
}

class _CategoriesHomepageState extends State<CategoriesHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Category',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            CategoryCard(icon: Icons.laptop, label: 'LAPTOP'),
            CategoryCard(icon: Icons.mobile_friendly, label: 'MOBILE'),
            CategoryCard(icon: Icons.sd_storage_outlined, label: 'SSD'),
            CategoryCard(icon: Icons.keyboard, label: 'KEYBORD AND MOUSE'),
            CategoryCard(icon: Icons.accessibility_new, label: 'ACCESSORIES'),
          ],
        ),
      ),
      
    );
  }
}

class CategoryCard extends StatefulWidget {
  final IconData icon;
  final String label;

  CategoryCard({required this.icon, required this.label});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, size: 50, color: Colors.grey),
          SizedBox(height: 10),
          Text(widget.label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
