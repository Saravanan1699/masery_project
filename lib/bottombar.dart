import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masery_project/cartpage.dart';
import 'dart:convert';
import 'Cart.dart';
import 'Categorys_pages/categories_homepage.dart';
import 'Categorys_pages/categorylistview.dart';
import 'home.dart';
import 'Categorys_pages/Categories.dart';
import 'wishlist.dart';

class BottomBar extends StatefulWidget {
  final Function(int) onTap;
  final List<Map<String, dynamic>> favoriteProducts;

  BottomBar({required this.onTap, required this.favoriteProducts});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int totalItems = 0;

  @override
  void initState() {
    super.initState();
    fetchTotalItems();
  }

  Future<void> fetchTotalItems() async {
    try {
      final response = await http.get(Uri.parse('https://sgitjobs.com/MaseryShoppingNew/public/api/totalitems'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          totalItems = int.parse(responseData['total_items'] ?? '0');
        });
      } else {
        throw Exception('Failed to load total items');
      }
    } catch (e) {
      print('Error fetching total items: $e');
      setState(() {
        totalItems = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        // BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.shopping_cart_outlined),
              if (totalItems > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '$totalItems',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        widget.onTap(index);
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Wishlist(favoriteProducts: widget.favoriteProducts),
            //   ),
            // );
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDescription()));

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
