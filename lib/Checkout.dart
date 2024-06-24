import 'package:flutter/material.dart';
import 'package:masery_project/shopping.dart';
import 'Categories.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Checkout'),
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
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              SizedBox(width: 10,),
              Text('Delivery Address',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),),
            ],
          ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SizedBox(
                      height: 95,
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Address :',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                                ),),
                                Spacer(),
                                Icon(Icons.edit_note),
                                SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('216 St Paul`s Rd, London N1 2LL,\n UK,Contact :  +44-784232'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SizedBox(
                      height: 95,
                      width: 100,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            IconButton(onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => shopping()));
                            },
                                icon: Icon(Icons.add_circle_outline_outlined,
                                size: 55,))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text('Shipping List',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  height: 215,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/lap.png',
                            height: 120,
                            width: 140,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('HP OMEN ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                                ),),
                                Row(
                                  children: [
                                    Text('Variations : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),),
                                    Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Black',
                                            style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Red',
                                              style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('4.8',
                                      style: TextStyle(fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star_half,size: 15,color: Colors.yellow,),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Card(
                                        elevation: 4,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: SizedBox(
                                          height: 30,
                                          width: 100,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('\$ 34.00',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17
                                              ),),
                                            ],
                                          )
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('upto 33% off',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xffEB3030)
                                        ),),
                                        Text('\$ 64.00',
                                          style: TextStyle(
                                              color: Color(0xffA7A7A7),
                                            decoration: TextDecoration.lineThrough,
                                            decorationColor: Color(0xffA7A7A7),
                                          ),),
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Total Order (1)   :',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                            ),),
                            Spacer(),
                            Text('\$ 34.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  height: 215,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/top.png',
                              height: 120,
                              width: 140,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('HP OMEN ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),),
                                Row(
                                  children: [
                                    Text('Variations : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),),
                                    Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Black',
                                              style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Red',
                                              style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('4.8',
                                      style: TextStyle(fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star_half,size: 15,color: Colors.yellow,),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Card(
                                        elevation: 4,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: SizedBox(
                                            height: 30,
                                            width: 100,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('\$ 34.00',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 17
                                                  ),),
                                              ],
                                            )
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('upto 33% off',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xffEB3030)
                                          ),),
                                        Text('\$ 64.00',
                                          style: TextStyle(
                                            color: Color(0xffA7A7A7),
                                            decoration: TextDecoration.lineThrough,
                                            decorationColor: Color(0xffA7A7A7),
                                          ),),
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Total Order (1)   :',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),),
                            Spacer(),
                            Text('\$ 34.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  height: 215,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/lap.png',
                              height: 120,
                              width: 140,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('HP OMEN ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),),
                                Row(
                                  children: [
                                    Text('Variations : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),),
                                    Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Black',
                                              style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Red',
                                              style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('4.8',
                                      style: TextStyle(fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star_half,size: 15,color: Colors.yellow,),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Card(
                                        elevation: 4,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: SizedBox(
                                            height: 30,
                                            width: 100,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('\$ 34.00',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 17
                                                  ),),
                                              ],
                                            )
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('upto 33% off',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xffEB3030)
                                          ),),
                                        Text('\$ 64.00',
                                          style: TextStyle(
                                            color: Color(0xffA7A7A7),
                                            decoration: TextDecoration.lineThrough,
                                            decorationColor: Color(0xffA7A7A7),
                                          ),),
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Total Order (1)   :',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),),
                            Spacer(),
                            Text('\$ 34.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  height: 215,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/top.png',
                              height: 120,
                              width: 140,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('HP OMEN ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),),
                                Row(
                                  children: [
                                    Text('Variations : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),),
                                    Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Black',
                                              style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Red',
                                              style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('4.8',
                                      style: TextStyle(fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                                    Icon(Icons.star_half,size: 15,color: Colors.yellow,),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Card(
                                        elevation: 4,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: SizedBox(
                                            height: 30,
                                            width: 100,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('\$ 34.00',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 17
                                                  ),),
                                              ],
                                            )
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('upto 33% off',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xffEB3030)
                                          ),),
                                        Text('\$ 64.00',
                                          style: TextStyle(
                                            color: Color(0xffA7A7A7),
                                            decoration: TextDecoration.lineThrough,
                                            decorationColor: Color(0xffA7A7A7),
                                          ),),
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Total Order (1)   :',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),),
                            Spacer(),
                            Text('\$ 34.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),),
                            SizedBox(
                              width: 15,
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
        ),
      ),
      // bottomNavigationBar: BottomBar(
      //   onTap: (index) {
      //     setState(() {});
      //   }, favoriteProducts: [],
      // ),
    );
  }
}
