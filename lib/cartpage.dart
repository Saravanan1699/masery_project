import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> carts = []; // List to hold fetched cart data
  bool isLoading = true; // Add a loading state

  // Function to fetch data from API
  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://sgitjobs.com/MaseryShoppingNew/public/api/carts'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Response Data: $responseData'); // Debugging print
        if (responseData['success'] == true) {
          final List<dynamic> data = responseData['data'];
          if (data.isNotEmpty) {
            setState(() {
              carts = data.map((cart) {
                cart['inventories'] = cart['inventories'].map((inventory) {
                  inventory['quantity'] = inventory['quantity'] ?? 1; // Initialize quantity to 1 if null
                  return inventory;
                }).toList();
                return cart;
              }).toList();
            });
            print('Carts: $carts'); // Debugging print
          }
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e'); // Debugging print
    } finally {
      setState(() {
        isLoading = false; // Set loading to false after fetching data
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('My Cart'),
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 15,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          isLoading
              ? Center(child: CircularProgressIndicator()) // Show loading indicator
              : carts.isEmpty
              ? Center(child: Text('No carts found')) // Show message when no carts found
              : ListView.builder(
            itemCount: carts.length,
            itemBuilder: (BuildContext context, int index) {
              final cart = carts[index];
              final List<dynamic> inventories = cart['inventories'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: inventories.map((inventory) {
                  String imageUrl = inventory['product']['images'].isNotEmpty
                      ? 'https://sgitjobs.com/MaseryShoppingNew/public/${inventory['product']['images'][0]['path']}'
                      : 'assets/products/images/default_image.png'; // Provide a default image URL
                  double minPrice = double.tryParse(inventory['product']['min_price']) ?? 0.0; // Parsing minimum price
                  double maxPrice = double.tryParse(inventory['product']['max_price']) ?? 0.0; // Parsing maximum price
                  int quantity = inventory['quantity'] ?? 1; // Get the quantity

                  return Center(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        inventory['product']['name'] ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text(
                                            '\$${maxPrice.toStringAsFixed(2)}', // Display maximum price
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.lineThrough, // Add strikethrough
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text(
                                            '\$${minPrice.toStringAsFixed(2)}', // Display minimum price
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quantity > 1) {
                                                inventory['quantity']--;
                                              }
                                            });
                                          },
                                          icon: Icon(Icons.remove, color: Colors.orangeAccent),
                                        ),
                                        Text(quantity.toString(), style: TextStyle(fontSize: 16)),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              inventory['quantity']++;
                                            });
                                          },
                                          icon: Icon(Icons.add, color: Colors.orangeAccent),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete, color: Colors.orangeAccent),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white70,
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grand Total:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${calculateGrandTotal().toStringAsFixed(2)}', // Replace with your grand total calculation
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: carts.isEmpty
                        ? null // Disable button if no carts
                        : () {
                      // Implement action when button is pressed
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: carts.isEmpty ? Colors.grey : Color(0xff0D6EFD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculateGrandTotal() {
    double grandTotal = 0.0;
    for (var cart in carts) {
      for (var inventory in cart['inventories']) {
        int quantity = inventory['quantity'] ?? 1; // Ensure quantity is not null
        grandTotal += (double.tryParse(inventory['product']['min_price']) ?? 0.0) * quantity;
      }
    }
    return grandTotal;
  }
}
