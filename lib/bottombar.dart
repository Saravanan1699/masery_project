import 'package:flutter/material.dart';
import 'home.dart';
import 'Categories.dart';
import 'place_order.dart';
import 'wishlist.dart';

class BottomBar extends StatelessWidget {
  final Function(int) onTap;
  final List<Map<String, dynamic>> favoriteProducts;

  BottomBar({required this.onTap, required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        onTap(index);
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Wishlist(favoriteProducts: favoriteProducts),
              ),
            );
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrder()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
            break;
          case 4:
            Scaffold.of(context).openEndDrawer();
            break;
          default:
            break;
        }
      },
    );
  }
}
