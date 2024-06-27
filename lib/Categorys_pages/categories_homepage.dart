import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home.dart';
import 'Categories.dart';
import 'Categories_mobile.dart';
import 'Graphics_card.dart';

class CategoriesHomepage extends StatefulWidget {
  @override
  State<CategoriesHomepage> createState() => _CategoriesHomepageState();
}

class _CategoriesHomepageState extends State<CategoriesHomepage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Category',
          style: GoogleFonts.raleway(
            fontSize: screenWidth * 0.05, // Slightly smaller font size for the description
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
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                  size: 15,),
                onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            CategoryCard(
              image: Image.asset('assets/top.png'), // Replace with your image path
              label: 'Laptop',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
              },
            ),
            CategoryCard(
              image: Image.asset('assets/Mobile_3.png'), // Replace with your image path
              label: 'Mobile',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Categories_mobile()));
              },
            ),
            CategoryCard(
              image: Image.asset('assets/Graphics_card.png'), // Replace with your image path
              label: 'Graphics Card',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Graphics_card()));
              },
            ),
            CategoryCard(
              image: Image.asset('assets/Memory.png'), // Replace with your image path
              label: 'SSD',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage()));
              },
            ),
            CategoryCard(
              image: Image.asset('assets/Keyboard.png'), // Replace with your image path
              label: 'Keyboard & Mouse',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage()));
              },
            ),
            CategoryCard(
              image: Image.asset('assets/Motherboard.png'), // Replace with your image path
              label: 'Motherboard',
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage()));
              },
            ),
          ],
        ),
      )

    );
  }
}

class CategoryCard extends StatelessWidget {
  final Image image;
  final String label;
  final VoidCallback onTap;

  CategoryCard({
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(label,
                style: GoogleFonts.raleway(
                fontSize: screenWidth * 0.04, // Slightly smaller font size for the description
                fontWeight: FontWeight.w700, // Regular weight for the description
                color: Color(0xFF2B2B2B),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}



