import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masery_project/Categorys_pages/viewcart.dart';
import '../bottombar.dart';
import 'categories_homepage.dart';

class Graphics_card extends StatefulWidget {
  const Graphics_card({super.key});

  @override
  State<Graphics_card> createState() => _Graphics_cardState();
}

class _Graphics_cardState extends State<Graphics_card> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    TextStyle commonTextStyle = GoogleFonts.montserrat(
      fontSize: screenWidth * 0.04,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2B2B2B),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Graphics Card',
          style: GoogleFonts.raleway(
            fontSize: screenWidth * 0.05, // Slightly smaller font size for the description
            fontWeight: FontWeight.w700, // Regular weight for the description
            color: Color(0xFF2B2B2B),
          ),),
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                  size: 15,),
                onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesHomepage()));
                  });
                },
              ),
            );
          },
        ),
      ),
      body: LayoutBuilder(
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
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              '52,082+ Items',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SizedBox(
                              height: 30.0,
                              width: 85.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Sort'),
                                  SizedBox(width: 8.0),
                                  Icon(Icons.filter_list_outlined,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SizedBox(
                              height: 30.0,
                              width: 85.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Filter'),
                                  SizedBox(width: 8.0),
                                  Icon(Icons.filter_alt, color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ResponsiveCardRow(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          commonTextStyle: commonTextStyle,
                          imagePath1: 'assets/Graphics_card.png',
                          brand1: 'ASUS',
                          description1:
                          'ASUS RTX4070TI ROG STRIX GAMING 12GB',
                          price1: '\$ 1679',
                          imagePath2: 'assets/Galax.png',
                          brand2: 'GALAX',
                          description2:
                          'GALAX RTX 4070 EX GAMER 12GB GDDR6X',
                          price2: '\$ 899',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ResponsiveCardRow(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          commonTextStyle: commonTextStyle,
                          imagePath1: 'assets/ASROCK.png',
                          brand1: 'ASRock RX 7600 SL 8GO',
                          description1:
                          '(Steel legend) GPU -ASR-90-GA4DZZ-00UANF',
                          price1: '\$ 439',
                          imagePath2: 'assets/GIGABYTE.png',
                          brand2: 'GIGABYTE RADEON',
                          description2:
                          'RX 7700 XT GAMING OC 12G -GV-R77XTGAMING OC-12GD',
                          price2: '\$ 698',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ResponsiveCardRow(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          commonTextStyle: commonTextStyle,
                          imagePath1: 'assets/SAPPHIRE.png',
                          brand1: 'SAPPHIRE',
                          description1: 'NITRO+ AMD Radeon RX 7700 XT 12GB',
                          price1: '\$ 759',
                          imagePath2: 'assets/ZOTAC.png',
                          brand2: 'ZOTAC',
                          description2: 'GAMING RTX 4060 SOLO 8GB',
                          price2: '\$ 438',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ResponsiveCardRow(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          commonTextStyle: commonTextStyle,
                          imagePath1: 'assets/MSI.png',
                          brand1: 'MSI GEFORCE',
                          description1:
                          'RTX 4070 SUPER 12G GAMING X SLIM',
                          price1: '\$ 480',
                          imagePath2: 'assets/lap.png',
                          brand2: 'ASUS TUF',
                          description2:
                          'Intel Core i5-11400H 11th Gen,15.6-inch (39.62 cm) ...',
                          price2: '₹45000',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomBar(
        onTap: (index) {
          setState(() {});
        }, favoriteProducts: [],
      ),
    );

  }
}

class ResponsiveCardRow extends StatelessWidget {
  const ResponsiveCardRow({
    Key? key,
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
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCard(
          context,
          screenWidth,
          screenHeight,
          commonTextStyle,
          imagePath1,
          brand1,
          description1,
          price1,
        ),
        SizedBox(width: 10),
        buildCard(
          context,
          screenWidth,
          screenHeight,
          commonTextStyle,
          imagePath2,
          brand2,
          description2,
          price2,
        ),
      ],
    );
  }

  Widget buildCard(
      BuildContext context,
      double screenWidth,
      double screenHeight,
      TextStyle commonTextStyle,
      String imagePath,
      String brand,
      String description,
      String price,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => cartview(

            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: screenHeight * 0.4,
          width: screenWidth * 0.45,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.01),
              Image.asset(imagePath, height: screenHeight * 0.2, width: screenWidth * 0.4),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(brand, style: commonTextStyle),
                    Text(
                      description,
                      style: GoogleFonts.montserrat(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                    Text(price, style: commonTextStyle),
                    RatingBar.builder(
                      initialRating: 4.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: screenWidth * 0.05,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
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
  }
}
