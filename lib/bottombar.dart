import 'package:flutter/material.dart';
import 'Categories.dart';


class BottomBar extends StatelessWidget {
  final Function(int) onTap;

  BottomBar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.black, // For the selected icon and label
      unselectedItemColor: Colors.black,
      onTap: (index) {
        onTap(index);

        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categories()),
            );
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
