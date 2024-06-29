import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:masery_project/Categorys_pages/Graphics_card.dart';
import 'dart:convert';
import '../Base_Url/BaseUrl.dart';
import '../home.dart';
import 'Categories.dart';
import 'Categories_mobile.dart';

class CategoriesHomepage extends StatefulWidget {
  @override
  State<CategoriesHomepage> createState() => _CategoriesHomepageState();
}

class _CategoriesHomepageState extends State<CategoriesHomepage> {
  List categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}categories'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        categories = data['data'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  void navigateToCategoryPage(String categoryName) {
    Widget page;
    switch (categoryName) {
      case 'Asus':
        page = Categories();
        break;
      case 'Acer':
        page = Categories();
        break;
      case 'HP':
        page = GraphicsCard();
        break;
      case 'Samsung':
        page = GraphicsCard();
        break;
      case 'Lenovo':
        page = Categories();
        break;
      case 'Apple':
        page = Categories();
        break;
      case 'Android':
        page = Categories_mobile();
        break;
      case 'Samsung A13':
        page = Categories_mobile();
        break;
      default:
        page = Categories(); 
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

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
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w700,
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
                icon: Icon(Icons.arrow_back_ios_new_outlined, size: 15),
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              image: Image.asset('assets/top.png'), // Replace with your image path or use a dynamic image
              label: categories[index]['name'],
              onTap: () {
                navigateToCategoryPage(categories[index]['name']);
              },
            );
          },
        ),
      ),
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
              child: Text(
                label,
                style: GoogleFonts.raleway(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2B2B2B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
