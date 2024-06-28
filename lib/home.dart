import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';

import 'Categorys_pages/categories_homepage.dart';
import 'Settings/My_Profile.dart';
import 'bottombar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> mostpopular = [
    {
      'image': 'assets/mp_1.png',
      'name': 'Graphics Card',
      'price': '\$300',
      'isFavorite': false,
    },
    {
      'image': 'assets/mp_2.png',
      'name': 'Mobile Phone',
      'price': '\$700',
      'isFavorite': false,
    },
    {
      'image': 'assets/mp_2.png',
      'name': 'Mobile Phone',
      'price': '\$700',
      'isFavorite': false,
    },
    {
      'image': 'assets/mp_3.png',
      'name': 'SSD',
      'price': '\$120',
      'isFavorite': false,
    },
    {
      'image': 'assets/mp_4.png',
      'name': 'Electronics',
      'price': '\$450',
      'isFavorite': false,
    },
    {
      'image': 'assets/mp_5.png',
      'name': 'Accessories',
      'price': '\$80',
      'isFavorite': false,
    },
    {
      'image': 'assets/mp_5.png',
      'name': 'Accessories',
      'price': '\$80',
      'isFavorite': false,
    },
  ];
  List<dynamic> banners = [];
  List<dynamic> featuredProducts = [];
  List<dynamic> recentProducts = [];
  List<dynamic> allProducts = [];
  List<dynamic> categoryBasedProducts = [];
  late PageController _pageController;
  double _currentPage = 0.0;
  Timer? _timer;
  final TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    fetchData();

    // Start the timer to auto-scroll every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page!.round() + 1) % banners.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://sgitjobs.com/MaseryShoppingNew/public/api/homescreen'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        banners = jsonResponse['data']['banners'];
        featuredProducts = jsonResponse['data']['featured_products'];
        recentProducts = jsonResponse['data']['recent_products'];
        allProducts = jsonResponse['data']['allProducts'];
        categoryBasedProducts = jsonResponse['data']['categoryBasedProducts'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: Center(child: Text('Masery Shop')),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo.png'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
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
            child: banners.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: banners.length,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page.toDouble();
                        });
                      },
                      itemBuilder: (context, index) {
                        final banner = banners[index];
                        final imageUrl = 'https://sgitjobs.com/MaseryShoppingNew/public/${banner['path']}';
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  DotsIndicator(
                    dotsCount: banners.length,
                    position: _currentPage,
                    decorator: const DotsDecorator(
                      activeColor: Colors.blue,
                      size: Size.square(8.0),
                      activeSize: Size.square(8.0),
                    ),
                    onTap: (index) {
                      _pageController.animateToPage(
                        index.toInt(),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // Featured Products Section
                  Row(
                    children: [
                      const Text(
                        'Featured Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredProducts.length,
                      itemBuilder: (context, index) {
                        final product = featuredProducts[index];
                        final imageUrl = 'https://sgitjobs.com/MaseryShoppingNew/public/${product['product']['image'][0]['path']}';

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15.0)),
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product['title'],
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '\$${product['sale_price']}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Row(
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child:  IconButton(onPressed: ( ) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoriesHomepage()),
                          );
                        }, icon: Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: Colors.white,
                        ),)
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryBasedProducts.length,
                      itemBuilder: (context, index) {
                        final product = categoryBasedProducts[index];

                        // Check if product or product['product'] is null
                        if (product == null || product['product'] == null) {
                          return SizedBox(); // or another fallback widget or loading indicator
                        }

                        final imageUrl = product['product']['image'] != null && product['product']['image'].isNotEmpty
                            ? 'https://sgitjobs.com/MaseryShoppingNew/public/${product['product']['image'][0]['path']}'
                            : ''; // Provide a default value if image path is null or empty

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15.0),
                                    ),
                                    image: imageUrl.isNotEmpty
                                        ? DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.contain,
                                    )
                                        : null, // Handle empty image URL case
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product['slug'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '\$${product['sale_price'] ?? ''}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Featured Products Section
                  Row(
                    children: [
                      const Text(
                        'Our Best Collections',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        final product = allProducts[index]['product'];
                        final products = allProducts[index];
                        final imageUrl = product['image'] != null && product['image'].isNotEmpty
                            ? 'https://sgitjobs.com/MaseryShoppingNew/public/${product['image'][0]['path']}'
                            : ''; // Provide a default value if image path is null or empty
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15.0),
                                    ),
                                    image: imageUrl.isNotEmpty
                                        ? DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.contain,
                                    )
                                        : null, // Handle empty image URL case
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    products['title'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '\$${products['sale_price'] ?? ''}', // Use null-aware operator to handle null sale_price
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Recent Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentProducts.length,
                      itemBuilder: (context, index) {
                        final products = allProducts[index];
                        final product = recentProducts[index]['product'];
                        final imageUrl = product['image'] != null && product['image'].isNotEmpty
                            ? 'https://sgitjobs.com/MaseryShoppingNew/public/${product['image'][0]['path']}'
                            : ''; // Provide a default value if image path is null or empty
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15.0),
                                    ),
                                    image: imageUrl.isNotEmpty
                                        ? DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.contain,
                                    )
                                        : null, // Handle empty image URL case
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    products['title'] ?? '', // Use null-aware operator to handle null title
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '\$${products['sale_price'] ?? ''}', // Use null-aware operator to handle null sale_price
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        onTap: (index) {
          // Handle bottom bar tap if necessary
        },
        favoriteProducts:
        mostpopular.where((product) => product['isFavorite']).toList(),
      ),
    );
  }
}
