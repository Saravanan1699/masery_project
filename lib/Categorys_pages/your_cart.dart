import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, String>> cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];
          return ListTile(
            leading: Image.asset(item['image']!),
            title: Text(item['name']!),
            subtitle: Text(item['price']!),
          );
        },
      ),
    );
  }
}
