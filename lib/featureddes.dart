import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, dynamic> product;

  ProductDetail({required this.product});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late PageController _pageController;
  double _currentPage = 0;
  bool isFavorite = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void addToCart(Map<String, String> productMap) {
    // Implement your add to cart functionality here
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: product == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      product['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      '\$${(product['sku'])}  In Stock',
                      style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0FBC00),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 350,
                          width: screenWidth,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: product['product']['image'].length,
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
                                        image: NetworkImage(
                                            'https://sgitjobs.com/MaseryShoppingNew/public/${product['product']['image'][index]['path']}'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 0,
                      //   right: 15,
                      //   child: IconButton(
                      //     onPressed: toggleFavorite,
                      //     icon: Icon(
                      //       isFavorite ? Icons.favorite : Icons.favorite_border,
                      //       color: isFavorite ? Colors.red : null,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Center(
                    child: DotsIndicator(
                      dotsCount: product['product']['image'].length,
                      position: _currentPage,
                      decorator: DotsDecorator(
                        color: Color(0xff0D6EFD),
                        activeColor: Color(0xffF87265),
                        size: Size.square(9.0),
                        activeSize: Size(18.0, 9.0),
                        spacing: EdgeInsets.symmetric(horizontal: 5.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$${(product['sale_price'] != null) ? double.parse(product['sale_price']).toStringAsFixed(2) : ''}',
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF6B7280),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '\$${(product['offer_price'] != null) ? double.parse(product['offer_price']).toStringAsFixed(2) : ''}',
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2B2B2B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      _isExpanded
                          ? product['description']
                          : '${product['description'].substring(0, 100)}...',
                      style: TextStyle(
                        color: Color(0xff707B81),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (product['description'].length > 100)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? 'Read Less' : 'Read More',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
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
                            Map<String, String> productMap = {
                              'image': product['product']['image'].isNotEmpty
                                  ? product['product']['image'][0]['path']
                                  : 'assets/placeholder.png',
                              'name': product['title'],
                              'price':
                                  '\$${product['offer_price'].toStringAsFixed(2)}',
                            };
                            addToCart(productMap);
                          },
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Color(0xff0D6EFD),
                              fontSize: 17,
                            ),
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
                        SizedBox(width: 15),
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MultistepForm(),
                            //   ),
                            // );
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
                ],
              ),
            ),
    );
  }
}
