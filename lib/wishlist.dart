import 'package:flutter/material.dart';
import 'bottombar.dart';

class Wishlist extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteProducts;
  const Wishlist({super.key, required this.favoriteProducts});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
        ],
        // leading: IconButton(onPressed: onPressed, icon: icon),
      ),
      body: widget.favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: screenWidth * 0.25,
                    color: Colors.grey,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Your Wishlist is Empty',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.4),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0D6EFD),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.25,
                      ),
                        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
    ),
                    ),
                    
                    child: Text(
                      'Start Shopping',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth < 600 ? 2 : 4,
                crossAxisSpacing: screenWidth * 0.02,
                mainAxisSpacing: screenHeight * 0.02,
                childAspectRatio: 0.75,
              ),
              itemCount: widget.favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = widget.favoriteProducts[index];
                return Container(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: screenWidth * 0.05,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: Image.asset(
                              product['image'],
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        product['name'],
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        product['price'],
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomBar(
        onTap: (index) {
          setState(() {});
        },
        favoriteProducts: widget.favoriteProducts,
      ),
    );
  }
}
