import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String brand;
  final String name;
  final String description;
  final double minPrice;
  final double maxPrice;
  final List<String> imagePaths;

  Product({
    required this.id,
    required this.brand,
    required this.name,
    required this.description,
    required this.minPrice,
    required this.maxPrice,
    required this.imagePaths,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var images = json['image'] as List<dynamic>? ?? [];
    List<String> imagePaths = images.map((i) => i['path'] as String? ?? '').toList();

    return Product(
      id: json['id'] ?? 0,
      brand: json['brand'] ?? 'Unknown',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No description',
      minPrice: double.tryParse(json['min_price']?.toString() ?? '0.0') ?? 0.0,
      maxPrice: double.tryParse(json['max_price']?.toString() ?? '0.0') ?? 0.0,
      imagePaths: imagePaths,
    );
  }
}

class Category {
  final int id;
  final String name;
  final String description;
  final List<Product> products;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var products = (json['products'] as List<dynamic>? ?? [])
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No description',
      products: products,
    );
  }
}

class CategoryDescription extends StatefulWidget {
  @override
  _CategoryDescriptionState createState() => _CategoryDescriptionState();
}

class _CategoryDescriptionState extends State<CategoryDescription> {
   TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  List<Category> categories = [];
  bool isLoading = true;
  bool hasError = false;
  late PageController _pageController;

@override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    fetchFeaturedProducts();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://sgitjobs.com/MaseryShoppingNew/public/api/homescreen'),
      );
      if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']['categoryBasedProducts'] as List;
        setState(() {
          categories = data.map((categoryJson) => Category.fromJson(categoryJson)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load featured products');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text('Failed to load data'))
              : LayoutBuilder(
                  builder: (context, constraints) {
                    double screenWidth = constraints.maxWidth;
                    double screenHeight = constraints.maxHeight;

                    TextStyle commonTextStyle = TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B2B2B),
                    );

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _searchController,
                            focusNode: _focusNode,
                            decoration: InputDecoration(
                              hintText: 'Search any Product...',
                              prefixIcon: Icon(Icons.search, color: Color(0xffBBBBBB)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xffF2F2F2),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                     Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: categories.expand((category) {
                                return category.products.map((product) => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ResponsiveCardRow(
                                    screenWidth: screenWidth,
                                    screenHeight: screenHeight,
                                    commonTextStyle: commonTextStyle,
                                    imagePath1: product.imagePaths.isNotEmpty ? product.imagePaths[0] : '',
                                    brand1: product.name,
                                    description1: product.description,
                                    price1: '\$${product.minPrice}',
                                    imagePath2: product.imagePaths.length > 1 ? product.imagePaths[1] : '',
                                    brand2: product.name,
                                    description2: product.description,
                                    price2: '\$${product.maxPrice}',
                                  ),
                                ));
                              }).toList(),
                            ),
                          ),
                        ),  ],
                    );
                  },
                ),
    );
  }
}

class ResponsiveCardRow extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final TextStyle commonTextStyle;
  final String imagePath1;
  final String brand1;
  final String description1;
  final String price1;
  final String imagePath2;
  final String brand2;
  final String description2;
  final String price2;

  ResponsiveCardRow({
    required this.screenWidth,
    required this.screenHeight,
    required this.commonTextStyle,
    required this.imagePath1,
    required this.brand1,
    required this.description1,
    required this.price1,
    required this.imagePath2,
    required this.brand2,
    required this.description2,
    required this.price2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildProductCard(imagePath1, brand1, description1, price1),
        buildProductCard(imagePath2, brand2, description2, price2),
      ],
    );
  }

  Widget buildProductCard(String imagePath, String brand, String description, String price) {
    return Card(
      elevation: 4,
      child: Container(
        width: screenWidth * 0.45,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imagePath.isNotEmpty
                ? _buildImage(imagePath)
                : Container(height: screenHeight * 0.2, width: screenWidth * 0.4, color: Colors.grey),
            SizedBox(height: 8.0),
            Text(brand, style: commonTextStyle),
            Text(description, style: TextStyle(fontSize: screenWidth * 0.035)),
            Text(price, style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
   Widget _buildImage(String imagePath) {
    if (imagePath.startsWith('http')) {
      return Image.network(imagePath, fit: BoxFit.cover, height: screenHeight * 0.2, width: screenWidth * 0.4);
    } else {
      return Image.asset(imagePath, fit: BoxFit.cover, height: screenHeight * 0.2, width: screenWidth * 0.4);
    }
  }
}
