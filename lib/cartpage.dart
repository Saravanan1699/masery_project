import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Multiple_stepform/step_form.dart';
import 'home.dart'; // Replace with your actual home page import

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> carts = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://sgitjobs.com/MaseryShoppingNew/public/api/carts'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['success'] == true) {
          final List<dynamic> data = responseData['data'];
          if (data.isNotEmpty) {
            setState(() {
              carts = data.map((cart) {
                cart['inventories'] = cart['inventories'].map((inventory) {
                  inventory['quantity'] = inventory['quantity'] ?? 1;
                  return inventory;
                }).toList();
                return cart;
              }).toList();
            });
          }
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updateCartItemQuantity(BuildContext context, int cartId, int itemId, int newQuantity) async {
    final String url = 'https://sgitjobs.com/MaseryShoppingNew/public/api/cart/$cartId/update?item=$itemId&quantity=$newQuantity';

    try {
      final response = await http.put(Uri.parse(url));

      if (response.statusCode == 200) {
        // Update local state to reflect the new quantity
        setState(() {
          carts.forEach((cart) {
            var inventory = cart['inventories'].firstWhere((inv) => inv['id'] == itemId, orElse: () => null);
            if (inventory != null) {
              inventory['quantity'] = newQuantity;
            }
          });
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item quantity updated successfully'),
          ),
        );
      } else {
        print('Failed to update item quantity: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update item quantity: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> removeItemFromCart(int cartId, int itemId) async {
    final String url = 'https://sgitjobs.com/MaseryShoppingNew/public/api/cart/removeItem?cart=$cartId&item=$itemId';
    try {
      final response = await http.delete(Uri.parse(url)); // Use DELETE method instead of GET

      if (response.statusCode == 200) {
        print('Item removed successfully');
        await fetchData();
        setState(() {
          carts.forEach((cart) {
            cart['inventories'].removeWhere((inventory) => inventory['id'] == itemId);
          });
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item removed successfully'),
          ),
        );
      } else {
        print('Failed to remove item: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to remove item: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

    @override
  void initState() {
    super.initState();
    fetchData();
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
                  double unitPrice = double.tryParse(inventory['pivot']['unit_price']) ?? 0.0;
                  int quantity = inventory['quantity'] ?? 1; // Get the quantity

                  // Calculate total price based on initial quantity and unit price
                  double totalPrice = unitPrice * quantity.toDouble();

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
                                            '\$${totalPrice.toStringAsFixed(2)}', // Display updated total price
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
                                          onPressed: () async {
                                            if (quantity > 1) {
                                              await updateCartItemQuantity(
                                                context,
                                                int.parse(inventory['pivot']['cart_id'].toString()),
                                                inventory['id'],
                                                quantity - 1,
                                              );
                                              setState(() {
                                                inventory['quantity'] = quantity - 1; // Update local state with new quantity
                                              });
                                            }
                                          },
                                          icon: Icon(Icons.remove, color: Colors.orangeAccent),
                                        ),
                                        Text(inventory['quantity'].toString(), style: TextStyle(fontSize: 16)), // Display updated quantity
                                        IconButton(
                                          onPressed: () async {
                                            await updateCartItemQuantity(
                                              context,
                                              int.parse(inventory['pivot']['cart_id'].toString()),
                                              inventory['id'],
                                              quantity + 1,
                                            );
                                            setState(() {
                                              inventory['quantity'] = quantity + 1; // Update local state with new quantity
                                            });
                                          },
                                          icon: Icon(Icons.add, color: Colors.orangeAccent),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        print('Cart ID: ${inventory['pivot']['cart_id']}'); // Print Cart ID
                                        print('Inventory ID: ${inventory['pivot']['inventory_id']}'); // Print Inventory ID
                                        int cartId = int.tryParse(inventory['pivot']['cart_id'].toString()) ?? 0;
                                        int itemId = int.tryParse(inventory['pivot']['inventory_id'].toString()) ?? 0;
                                        if (cartId > 0 && itemId > 0) {
                                          removeItemFromCart(cartId, itemId);
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Invalid cart or item ID'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      },
                                      icon: Icon(Icons.delete, color: Colors.orangeAccent),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
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
                    '\$${calculateGrandTotal().toStringAsFixed(2)}', // Calculate and display grand total
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MultistepForm(product: {},)));
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
        grandTotal += (double.tryParse(inventory['pivot']['unit_price']) ?? 0.0) * quantity;
      }
    }
    return grandTotal;
  }
}

