import 'dart:collection';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:masery_project/Categorys_pages/Graphics_card.dart';
import 'package:masery_project/Categorys_pages/ourbest_product.dart';
import 'package:masery_project/Categorys_pages/recent_product.dart';
import 'package:masery_project/featureddes.dart';
import 'Categorys_pages/categories_homepage.dart';
import 'Categorys_pages/categorylistview.dart';
import 'Settings/Display_notification.dart';
import 'Settings/My_Profile.dart';
import 'Settings/notification.dart';
import 'bottombar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _notificationCount = 0;

  void _incrementCount() {
    setState(() {
      _notificationCount++;
    });
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
  List<dynamic> banners = [];
  List<dynamic> featuredProducts = [];
  List<dynamic> recentProducts = [];
  List<dynamic> allProducts = [];
  List<dynamic> categoryBasedProducts = [];
  List<dynamic> about = [];
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
    final response = await http.get(Uri.parse(
        'https://sgitjobs.com/MaseryShoppingNew/public/api/homescreen'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        banners = jsonResponse['data']['banners'];
        featuredProducts = jsonResponse['data']['featured_products'];
        recentProducts = jsonResponse['data']['recent_products'];
        allProducts = jsonResponse['data']['allProducts'];
        categoryBasedProducts = jsonResponse['data']['categoryBasedProducts'];
        about = jsonResponse['data']['about'];
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Masery Shop',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Example: Simulate receiving a notification
                  NotificationData notificationData = NotificationData(
                    title: 'New Notification',
                    body: 'This is a new notification message.',
                    image: AssetImage('assets/logo.png'), // Replace with your actual image asset
                  );

                  // Navigate to the DisplayNotification page with the notification data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayNotification(notificationData: notificationData),
                    ),
                  );
                },
              ),
              Positioned(
                right: 11,
                top: 11,
                child: _notificationCount > 0
                    ? Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$_notificationCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                    : Container(),
              ),
            ],
          ),

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
                hintStyle: GoogleFonts.montserrat(

                ),
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
                ?  Center(
              child: Container(
                child: LoadingAnimationWidget.halfTriangleDot(
                  size: 50.0, color: Colors.redAccent,
                ),
              ),
            )

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
                        final imageUrl =
                            'https://sgitjobs.com/MaseryShoppingNew/public/${banner['path']}';
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
                    decorator: DotsDecorator(
                      color: Color(0xff0D6EFD),
                      activeColor: Color(0xffF87265),
                      size: Size.square(9.0),
                      activeSize: Size(18.0, 9.0),
                      spacing: EdgeInsets.symmetric(horizontal: 5.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
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
                      Text(
                        'Featured Products',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: GoogleFonts.montserrat(
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
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GraphicsCard()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors.white,
                            ),
                          ))
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
                        final imageUrl =
                            'https://sgitjobs.com/MaseryShoppingNew/public/${product['product']['image'][0]['path']}';

                        final offerStart =
                        DateTime.parse(product['offer_start']);
                        final offerEnd =
                        DateTime.parse(product['offer_end']);
                        final currentDate = DateTime.now();

                        final bool isOfferPeriod =
                            currentDate.isAfter(offerStart) &&
                                currentDate.isBefore(offerEnd);
                        final salePrice =
                        double.parse(product['sale_price']);
                        final offerPrice =
                        double.parse(product['offer_price']);

                        final double discountPercentage =
                            ((salePrice - offerPrice) / salePrice) * 100;

                        final int discountPercentageRounded =
                        discountPercentage.ceil();

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                  product: product,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          const BorderRadius.vertical(
                                            top: Radius.circular(15.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(imageUrl),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(8.0),
                                        child: Text(
                                          product['title'],
                                          style:  GoogleFonts.montserrat(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            if (isOfferPeriod) ...[
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$$salePrice',
                                                    style:
                                                    GoogleFonts.montserrat(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight
                                                          .normal,
                                                      decoration:
                                                      TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '\$$offerPrice',
                                                    style:
                                                    GoogleFonts.montserrat(
                                                      fontSize: 17,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ] else ...[
                                              Text(
                                                '\$$salePrice',
                                                style:  GoogleFonts.montserrat(
                                                  fontSize: 17,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (isOfferPeriod)
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius:
                                          BorderRadius.circular(30.0),
                                        ),
                                        padding:
                                        const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '$discountPercentageRounded%',
                                              style:  GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'OFF',
                                              style:  GoogleFonts.montserrat(
                                                fontSize: 9,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
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

                  Row(
                    children: [
                      Text(
                        'Categories',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: GoogleFonts.montserrat(
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
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryDescription()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryBasedProducts.length,
                      itemBuilder: (context, index) {
                        final category = categoryBasedProducts[index];
                        final products = category['products'];

                        if (products == null || products.isEmpty) {
                          return SizedBox(); // Return an empty SizedBox if products are null or empty
                        }

                        final product = products[
                        0]; // Assuming you want to access the first product

                        // Check if product and image path are not null before accessing
                        final imagePath = product['image'] != null &&
                            product['image'].isNotEmpty &&
                            product['image'][0]['path'] != null
                            ? product['image'][0]['path']
                            : '';

                        final imageUrl = imagePath.isNotEmpty
                            ? 'https://sgitjobs.com/MaseryShoppingNew/public/$imagePath'
                            : ''; // Provide a default empty URL if imagePath is empty

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  decoration: imageUrl.isNotEmpty
                                      ? BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.vertical(
                                      top: Radius.circular(15.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                      : BoxDecoration(), // Handle empty image URL case
                                ),
                                Container(
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    category['name'] ??
                                        '', // Provide default value
                                    style:  GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '${category['products_count'] ?? ''} Products', // Provide default value
                                    style:  GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
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
                  // Container(
                  //   height: 300,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: about.length,
                  //     itemBuilder: (context, index) {
                  //       final category = about[index];
                  //
                  //       // Constructing image URL
                  //       final imageUrl =
                  //           'https://sgitjobs.com/MaseryShoppingNew/public/${category['path']}';
                  //
                  //       return Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //           width: 200,
                  //           child: Column(
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Container(
                  //                 height: 150,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.vertical(
                  //                     top: Radius.circular(15.0),
                  //                   ),
                  //                   image: DecorationImage(
                  //                     image: NetworkImage(imageUrl),
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Text(
                  //                   category['title'] ??
                  //                       '', // Display category title
                  //                   style: const TextStyle(
                  //                     fontSize: 14,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 8.0),
                  //                 child: Text(
                  //                   category['description'] ??
                  //                       '', // Display category description
                  //                   style: const TextStyle(
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.normal,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),

                  Row(
                    children: [
                      Text(
                        'Our Best Collections',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: GoogleFonts.montserrat(
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
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OurbestproductList()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        final product = allProducts[index];
                        final imagePath =
                        product['product']?['image']?[0]?['path'];
                        final imageUrl = imagePath != null
                            ? 'https://sgitjobs.com/MaseryShoppingNew/public/$imagePath'
                            : 'https://example.com/placeholder.png'; // Placeholder image URL

                        final offerStartStr = product['offer_start'];
                        final offerEndStr = product['offer_end'];
                        final salePriceStr = product['sale_price'];
                        final offerPriceStr = product['offer_price'];

                        if (offerStartStr == null ||
                            offerEndStr == null ||
                            salePriceStr == null ||
                            offerPriceStr == null) {
                          // Skip this item if critical data is missing
                          return SizedBox.shrink();
                        }

                        final offerStart = DateTime.parse(offerStartStr);
                        final offerEnd = DateTime.parse(offerEndStr);
                        final currentDate = DateTime.now();

                        final bool isOfferPeriod =
                            currentDate.isAfter(offerStart) &&
                                currentDate.isBefore(offerEnd);
                        final salePrice = double.parse(salePriceStr);
                        final offerPrice = double.parse(offerPriceStr);

                        final double discountPercentage =
                            ((salePrice - offerPrice) / salePrice) * 100;
                        final int discountPercentageRounded =
                        discountPercentage.ceil();

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetail(product: product),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          const BorderRadius.vertical(
                                            top: Radius.circular(15.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(imageUrl),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.all(8.0),
                                        child: Text(
                                          product['title'] ?? 'No title',
                                          style:  GoogleFonts.montserrat(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            if (isOfferPeriod) ...[
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$$salePrice',
                                                    style:
                                                    GoogleFonts.montserrat(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight
                                                          .normal,
                                                      decoration:
                                                      TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '\$$offerPrice',
                                                    style:
                                                    GoogleFonts.montserrat(
                                                      fontSize: 17,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ] else ...[
                                              Text(
                                                '\$$salePrice',
                                                style:  GoogleFonts.montserrat(
                                                  fontSize: 17,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (isOfferPeriod)
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius:
                                          BorderRadius.circular(30.0),
                                        ),
                                        padding:
                                        const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '$discountPercentageRounded%',
                                              style:  GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'OFF',
                                              style:  GoogleFonts.montserrat(
                                                fontSize: 9,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
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

                  Row(
                    children: [
                      Text(
                        'Recent Products',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GraphicsCard1()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentProducts.length,
                      itemBuilder: (context, index) {
                        final product = recentProducts[index];
                        final imagePath =
                        product['product']?['image']?[0]?['path'];
                        final imageUrl = imagePath != null
                            ? 'https://sgitjobs.com/MaseryShoppingNew/public/$imagePath'
                            : 'https://example.com/placeholder.png'; // Placeholder image URL

                        final offerStartStr = product['offer_start'];
                        final offerEndStr = product['offer_end'];
                        final salePriceStr = product['sale_price'];
                        final offerPriceStr = product['offer_price'];

                        if (offerStartStr == null ||
                            offerEndStr == null ||
                            salePriceStr == null ||
                            offerPriceStr == null) {
                          // Skip this item if critical data is missing
                          return SizedBox.shrink();
                        }

                        final offerStart = DateTime.parse(offerStartStr);
                        final offerEnd = DateTime.parse(offerEndStr);
                        final currentDate = DateTime.now();

                        final bool isOfferPeriod =
                            currentDate.isAfter(offerStart) &&
                                currentDate.isBefore(offerEnd);
                        final salePrice = double.parse(salePriceStr);
                        final offerPrice = double.parse(offerPriceStr);

                        final double discountPercentage =
                            ((salePrice - offerPrice) / salePrice) * 100;
                        final int discountPercentageRounded =
                        discountPercentage.ceil();

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetail(product: product),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          const BorderRadius.vertical(
                                            top: Radius.circular(15.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(imageUrl),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(8.0),
                                        child: Text(
                                          product['title'] ?? 'No title',
                                          style:  GoogleFonts.montserrat(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            if (isOfferPeriod) ...[
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$$salePrice',
                                                    style:
                                                    GoogleFonts.montserrat(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight
                                                          .normal,
                                                      decoration:
                                                      TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '\$$offerPrice',
                                                    style:
                                                    GoogleFonts.montserrat(
                                                      fontSize: 17,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ] else ...[
                                              Text(
                                                '\$$salePrice',
                                                style:  GoogleFonts.montserrat(
                                                  fontSize: 17,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (isOfferPeriod)
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius:
                                          BorderRadius.circular(30.0),
                                        ),
                                        padding:
                                        const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '$discountPercentageRounded%',
                                              style:  GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'OFF',
                                              style:  GoogleFonts.montserrat(
                                                fontSize: 9,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
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
                  )
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
