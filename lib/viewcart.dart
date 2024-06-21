import 'package:flutter/material.dart';

import 'bottombar.dart';

class cartview extends StatefulWidget {
  const cartview({super.key});

  @override
  State<cartview> createState() => _cartviewState();
}

class _cartviewState extends State<cartview> {
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
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Masery'),
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.sort_sharp),
                onPressed: () {
                  setState(() {
                    Scaffold.of(context).openDrawer();
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
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
                suffixIcon: Icon(
                  Icons.mic,
                  color: Color(0xffBBBBBB),
                ),
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
                          '-23% \$ 71,990',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage('assets/lenovo-lap.jpg'),
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 15),
                    child: Text('Apple MacBook Air Laptop M1 chip, 13.3-inch/33.74 cm Retina'
                        ' Display, 8GB RAM, 256GB SSD Storage, Backlit Keyboard,'
                        ' FaceTime HD Camera, Touch ID. Works with '
                        'iPhone/iPad; Space Grey',
                    style: TextStyle(
                      color: Color(0xff707B81),
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 15),
                    child: Text('Read More...',
                      style: TextStyle(
                          color: Color(0xff0D6EFD),
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                      ),
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
          setState(() {});
        },
      ),
    );
  }
}
