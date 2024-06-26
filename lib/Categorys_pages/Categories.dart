import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masery_project/Categorys_pages/viewcart.dart';
import '../bottombar.dart';
import 'categories_homepage.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
        title: Text('Laptops',
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
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
                          '52,082+ Iteams ',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    cartview(),
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
                              height: 290.0,
                              width: 165.0,
                              child: Column(

                                children: [
                                  SizedBox(height: screenHeight * 0.01),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(image:  AssetImage('assets/top.png'),
                                        height: 150,
                                        width: 150,)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'iQOO Z7 Pro 5G',
                                          style: commonTextStyle,
                                        ),
                                        Text(
                                          '(Blue Lagoon, 8GB RAM, 256GB Storage) | 3D Curved AMOLED Display',
                                          style: GoogleFonts.montserrat(
                                            fontSize: screenWidth * 0.03, // Slightly smaller font size for the description
                                            fontWeight: FontWeight.w400, // Regular weight for the description
                                            color: Color(0xFF2B2B2B),
                                          ),
                                        ),
                                        Text(
                                          '₹23998',
                                          style: commonTextStyle,
                                        ),
                                        RatingBar.builder(
                                          initialRating: 4.5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20.0,
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SizedBox(
                            height: 290.0,
                            width: 165.0,
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image:  AssetImage('assets/lap.png'),
                                      height: 150,
                                      width: 150,)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('OnePlus 11R 5G',
                                        style: commonTextStyle,
                                      ),
                                      Text('(Solar Red, 8GB RAM, 128GB Storage)',
                                        style: GoogleFonts.montserrat(
                                          fontSize: screenWidth * 0.03, // Slightly smaller font size for the description
                                          fontWeight: FontWeight.w400, // Regular weight for the description
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text('₹30999',
                                        style: commonTextStyle,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SizedBox(
                            height: 290.0,
                            width: 165.0,
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image:  AssetImage('assets/lap.png'),
                                      height: 150,
                                      width: 150,)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Apple iPhone 15',
                                        style: commonTextStyle,
                                      ),
                                      Text('Pink, iOS, 128GB Storage',
                                        style: GoogleFonts.montserrat(
                                          fontSize: screenWidth * 0.03, // Slightly smaller font size for the description
                                          fontWeight: FontWeight.w400, // Regular weight for the description
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text('₹71999',
                                        style: commonTextStyle,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
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
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SizedBox(
                            height: 290.0,
                            width: 165.0,
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image:  AssetImage('assets/top.png'),
                                      height: 150,
                                      width: 150,)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Redmi 13C 5G',
                                        style: commonTextStyle,
                                      ),
                                      Text('(Starlight Black, 4GB RAM, 128GB Storage)',
                                        style: GoogleFonts.montserrat(
                                          fontSize: screenWidth * 0.03, // Slightly smaller font size for the description
                                          fontWeight: FontWeight.w400, // Regular weight for the description
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text('₹10499',
                                        style: commonTextStyle,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    cartview(),
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
                              height: 290.0,
                              width: 165.0,
                              child: Column(

                                children: [
                                  SizedBox(height: screenHeight * 0.01),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(image:  AssetImage('assets/top.png'),
                                        height: 150,
                                        width: 150,)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'iQOO Z7 Pro 5G',
                                          style: commonTextStyle,
                                        ),
                                        Text(
                                          '(Blue Lagoon, 8GB RAM, 256GB Storage) | 3D Curved AMOLED Display',
                                          style: GoogleFonts.montserrat(
                                            fontSize: screenWidth * 0.03, // Slightly smaller font size for the description
                                            fontWeight: FontWeight.w400, // Regular weight for the description
                                            color: Color(0xFF2B2B2B),
                                          ),
                                        ),
                                        Text(
                                          '₹23998',
                                          style: commonTextStyle,
                                        ),
                                        RatingBar.builder(
                                          initialRating: 4.5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20.0,
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
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SizedBox(
                            height: 290.0,
                            width: 165.0,
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image:  AssetImage('assets/lap.png'),
                                      height: 150,
                                      width: 150,)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('OnePlus 11R 5G',
                                        style: commonTextStyle,
                                      ),
                                      Text('(Solar Red, 8GB RAM, 128GB Storage)',
                                        style: GoogleFonts.montserrat(
                                          fontSize: screenWidth * 0.03, // Slightly smaller font size for the description
                                          fontWeight: FontWeight.w400, // Regular weight for the description
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text('₹30999',
                                        style: commonTextStyle,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SizedBox(
                            height: 290.0,
                            width: 165.0,
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image:  AssetImage('assets/lap.png'),
                                      height: 150,
                                      width: 150,)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Apple iPhone 15',
                                        style: commonTextStyle,
                                      ),
                                      Text('Pink, iOS, 128GB Storage',
                                        style: GoogleFonts.montserrat(
                                          fontSize: screenWidth * 0.03, // Slightly smaller font size for the description
                                          fontWeight: FontWeight.w400, // Regular weight for the description
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text('₹71999',
                                        style: commonTextStyle,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
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
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SizedBox(
                            height: 290.0,
                            width: 165.0,
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.01),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image:  AssetImage('assets/top.png'),
                                      height: 150,
                                      width: 150,)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Redmi 13C 5G',
                                        style: commonTextStyle,
                                      ),
                                      Text('(Starlight Black, 4GB RAM, 128GB Storage)',
                                        style: GoogleFonts.montserrat(
                                          fontSize: screenWidth * 0.03, // Slightly smaller font size for the description
                                          fontWeight: FontWeight.w400, // Regular weight for the description
                                          color: Color(0xFF2B2B2B),
                                        ),
                                      ),
                                      Text('₹10499',
                                        style: commonTextStyle,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20.0,
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
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
        }, favoriteProducts: [],
      ),
    );

  }
}
