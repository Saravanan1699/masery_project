import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'Categories.dart';
import 'Settings/My_Profile.dart';
import 'bottombar.dart';

import 'categories_homepage.dart';
import 'wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode _focusNode = FocusNode();
  List<String> getImagePaths() {
    return [
      'assets/Graphics.png',
      'assets/mobile.png',
      'assets/ssd.png',
      'assets/Electronics.png',
      'assets/accessories.png',
      'assets/another_image.png', // Add more paths if needed
    ];
  }
 final List<String> backgroundImages = [
    'assets/Colorful.png',
    'assets/laptop_image.png',
    'assets/offerlap.png',
    'assets/offerlaptop.png',
    'assets/offerslap.png',
  ];

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

  final List<List<String>> category = [
    [
      'assets/laptop.png',
      'assets/laptop.png',
      'assets/laptop.png',
      'assets/laptop.png'
    ],
    [
      'assets/laptop_1.png',
      'assets/laptop_1.png',
      'assets/laptop_1.png',
      'assets/laptop_1.png'
    ],
    [
      'assets/laptop_2.png',
      'assets/laptop_2.png',
      'assets/laptop_2.png',
      'assets/laptop_2.png'
    ],
    [
      'assets/laptop_2.png',
      'assets/laptop_2.png',
      'assets/laptop_2.png',
      'assets/laptop_2.png'
    ],
    [
      'assets/laptop_2.png',
      'assets/laptop_2.png',
      'assets/laptop_2.png',
      'assets/laptop_2.png'
    ],
  ];

  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  PageController _pageController = PageController();
  double _currentPage = 0;
   late Timer _timer;
    @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.page == backgroundImages.length - 1) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = getImagePaths();
    
    List<Map<String, String>> products = getProducts();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text('Masery Shop')),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         height: 50,
                    //         child: TextFormField(
                    //           controller: _searchController,
                    //           decoration: InputDecoration(
                    //             hintText: 'Search...',
                    //             prefixIcon:
                    //                 Icon(Icons.search, color: Color(0xffBBBBBB)),
                    //             suffixIcon: Icon(
                    //               Icons.mic,
                    //               color: Color(0xffBBBBBB),
                    //             ),
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //             filled: true,
                    //             fillColor: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                            color: Color(0xff828282),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Delivary to  Mari - Chennai 600118 ',
                            style: TextStyle(
                                color: Color(0xff828282), fontSize: 12),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined,
                              size: 15, color: Color(0xff828282)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  
                                  // fit: BoxFit.cover,
                                  image: AssetImage(
                                    
                                    imagePaths[
                                    
                                      index]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                     Container(
                      height: 200,
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
                                    image: AssetImage(backgroundImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    DotsIndicator(
                      dotsCount: backgroundImages.length,
                      position: _currentPage,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8.0),
                        activeSize: const Size.square(10.0),
                        spacing: const EdgeInsets.symmetric(horizontal: 5.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                   
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'New Item',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 25,
                            color: Colors
                                .white, // Ensure the icon is visible against the blue background
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
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
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Most Popular',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors
                                .blue, // Set the background color of the container
                            shape:
                                BoxShape.circle, // Make the container circular
                          ),
                          padding: EdgeInsets.all(
                              8.0), // Adjust the padding to control the size of the circle
                          child: Icon(
                            Icons.arrow_forward,
                            size: 25,
                            color: Colors
                                .white, // Ensure the icon is visible against the blue background
                          ),
                        )
                      ],
                    ),
                      Container(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mostpopular.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  mostpopular[index]['isFavorite'] = !mostpopular[index]['isFavorite'];
                });
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage(mostpopular[index]['image']),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                mostpopular[index]['price'],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                mostpopular[index]['isFavorite']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  mostpopular[index]['isFavorite'] = !mostpopular[index]['isFavorite'];
                                });
                              },
                            ),
                          ],
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
     
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoriesHomepage()),
                              );
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors
                                  .white, // Ensure the icon is visible against the blue background
                            ),
                          ),
                        )
                      ],
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column
                        Expanded(
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Upper Row in Left Column
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/laptop.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              8), // Adjust the spacing between the containers
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/laptop_1.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/laptop_2.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              8), // Adjust the spacing between the containers
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/laptop_1.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Laptops',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF2F2F2),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '108',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                            width:
                                15), // Adjust the spacing between the columns
                        // Right Column
                        Expanded(
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Upper Row in Right Column
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/laptop_1.png',
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              8), // Adjust the spacing between the containers
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/laptop_1.png',
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ],
                                  ),
                            
                                  // Lower Row in Right Column
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/laptop_1.png',
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              8), // Adjust the spacing between the containers
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/laptop_2.png',
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Accessories',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF2F2F2),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '530',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column
                        Expanded(
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Upper Row in Left Column
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/mp_3.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/ssd_4.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ],
                                  ),
                            
                                  // Lower Row in Left Column
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/ssd_1.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              8), // Adjust the spacing between the containers
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: Image.asset(
                                              'assets/ssd_4.png',
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Ssd & Rom',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        // Right Column
                        Expanded(
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Upper Row in Right Column
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            child: Image.asset(
                                                'assets/mp_4.png',
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            child: Image.asset(
                                                'assets/laptop_1.png',
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Lower Row in Right Column
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            child: Image.asset(
                                                'assets/laptop_1.png',
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                8), // Adjust the spacing between the containers
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            child: Image.asset(
                                                'assets/laptop_2.png',
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Graphics Card',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                 
                  ],
                ),
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
