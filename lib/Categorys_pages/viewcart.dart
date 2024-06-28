import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masery_project/Categorys_pages/your_cart.dart';
import '../Multiple_stepform/step_form.dart';
import 'Categories.dart';
import '../bottombar.dart';

class cartview extends StatefulWidget {
  const cartview({super.key});

  @override
  State<cartview> createState() => _cartviewState();
}

class _cartviewState extends State<cartview> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  PageController _pageController = PageController();
  double _currentPage = 0;
  bool _isExpanded = false;
  List<Map<String, String>> cart = [];
  int cartCount = 0;

  List<Map<String, String>> getProducts() {
    return [
      {
        'image': 'assets/laptop.png',
        'name':
            'Acer Aspire Lite AMD Ryzen 5 5500U Premium Thin and Light Laptop (16 GB RAM/512 GB SSD/Windows 11 Home)',
        'price': '\$300',
      },
      {
        'image': 'assets/laptop_1.png',
        'name':
            'Apple 2023 MacBook Pro (16-inch, M3 Max chip with 16‑core CPU and 40‑core GPU, 48GB Unified Memory, 1TB)',
        'price': '\$700',
      },
      {
        'image': 'assets/laptop_2.png',
        'name':
            'ASUS VivoBook 15 (2021) Thin and Light Laptop, Dual Core Intel Celeron N4020, 15.6-inch (39.62 cm) HD, (4GB RAM/256GB SSD/Integrated Graphics) ',
        'price': '\$120',
      },
      {
        'image': 'assets/laptop.png',
        'name':
            'Lenovo IdeaPad Slim 1 AMD Ryzen 5 5500U 15.6" HD Thin and Light Laptop (16GB/512GB SSD/Windows ',
        'price': '\$450',
      },
      {
        'image': 'assets/laptop_1.png',
        'name':
            'HONOR MagicBook X16 (2024), 12th Gen Intel Core i5-12450H, 16-inch (40.64 cm) FHD ',
        'price': '\$80',
      },
    ];
  }

  List<String> getBackgroundImages() {
    return [
      'assets/lenovo-lap.jpg',
      'assets/lenovo-lap.jpg',
      'assets/lenovo-lap.jpg',
      'assets/lenovo-lap.jpg',
    ];
  }

  List<String> getImagePaths() {
    return [
      'assets/Graphics.png',
      'assets/mobile.png',
      'assets/ssd.png',
      'assets/Electronics.png',
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void addToCart(Map<String, String> product) {
    setState(() {
      cart.add(product);
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = getProducts();
    List<String> backgroundImages = getBackgroundImages();
    List<String> imagePaths = getImagePaths();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Description',
          style: GoogleFonts.raleway(
            fontSize: screenWidth *
                0.05, // Slightly smaller font size for the description
            fontWeight: FontWeight.w700, // Regular weight for the description
            color: Color(0xFF2B2B2B),
          ),
        ),
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
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Categories()));
                  });
                },
              ),
            );
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              );
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue,
                  ),
                ),
                if (cartCount > 0)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '$cartCount',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
              ],
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
                // suffixIcon: Icon(
                //   Icons.mic,
                //   color: Color(0xffBBBBBB),
                // ),
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
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Apple MacBook',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          // '-23% \$ 71,990',
                          'In Stock',
                          style: GoogleFonts.inter(
                            // Using Google Fonts
                            fontSize:
                                screenWidth * 0.05, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0FBC00),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 350,
                          width: 350,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: backgroundImages.length,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page.toDouble();
                              });
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(backgroundImages[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                          top: 0,
                          left: 335,
                          child: IconButton(
                            onPressed: toggleFavorite,
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : null,
                            ),
                          )),
                    ],
                  ),
                  DotsIndicator(
                    dotsCount: imagePaths.length,
                    position: _currentPage,
                    decorator: DotsDecorator(
                      color: Color(0xff0D6EFD),
                      activeColor: Color(0xffF87265),
                      size: Size.square(9.0),
                      activeSize: Size(18.0, 9.0),
                      spacing: EdgeInsets.symmetric(horizontal: 5.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15),
                    child: Text(
                      'Apple MacBook Air Laptop M1 chip, 13.3-inch/33.74 cm Retina'
                      ' Display, 8GB RAM, 256GB SSD Storage, Backlit Keyboard,'
                      ' FaceTime HD Camera, Touch ID. Works with '
                      'iPhone/iPad; Space Grey',
                      style: TextStyle(
                          color: Color(0xff707B81),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Sale Price
                        Text(
                          '\$ 71,990',
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF6B7280),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                            width:
                                10), // Adjust spacing between prices if needed
                        // Purchase Price with Strikethrough
                        Text(
                          '\$ 65,000', // Example purchase price
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2B2B2B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Replace with actual product data
                            Map<String, String> product = {
                              'image': 'assets/laptop.png',
                              'name':
                                  'Acer Aspire Lite AMD Ryzen 5 5500U Premium Thin and Light Laptop (16 GB RAM/512 GB SSD/Windows 11 Home)',
                              'price': '\$300',
                            };
                            addToCart(product);
                          },
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                                color: Color(0xff0D6EFD), fontSize: 17),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Color(0xff0D6EFD)),
                            ),
                            minimumSize: Size(150, 50),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MultistepForm()));
                          },
                          child: Text(
                            'Buy Now',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0D6EFD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(150, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text(
                          'You may like',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff707B81)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward,
                            size: 15, color: Color(0xff707B81)),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15.0)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            products[index]['image']!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      products[index]['name']!,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      products[index]['price']!,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
          setState(() {});
        },
        favoriteProducts: [],
      ),
    );
  }
}
