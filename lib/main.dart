import 'package:flutter/material.dart';
import 'shoe_details.dart';

void main(){
  runApp(ShoeShopApp());
}

class ShoeShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoeShopScreen(),
    );
  }
}
class ShoeShopScreen extends StatelessWidget{
  final List<String> shoeImages = [
    'assets/shoes/shoe1.png',
    'assets/shoes/shoe2.png',
    'assets/shoes/shoe3.png',
    'assets/shoes/shoe4.png',
    'assets/shoes/shoe5.png',
    'assets/shoes/shoe6.png',
  ];

  final List<String> brandNames = [
    'Nike',
    'Nike',
    'Nike',
    'Nike',
    'Nike',
    'Nike',
  ];

  final List<String> brandDescriptions = [
  'FX5 Jumpster',
  'Runner Pro',
  'Trend Max ',
  'Lightweight Speed',
  'Classic Runner 7',
  'Sneakster Supreme',
];

final List<String> brandPrices = [
  '\$40',
  '\$69',
  '\$99',
  '\$89',
  '\$39',
  '\$129',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: Text(
          'Sneakers',
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.swap_vert),
            color: Colors.black,
            iconSize: 30,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            color: Colors.black,
            iconSize: 30,
            onPressed: (){},
          ),
        ]
        ),
      ),
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
              child: Text(
                ' 25 products found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: shoeImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShoeDetailsPage(
                              image: shoeImages[index],
                              name: brandNames[index],
                              description: brandDescriptions[index],
                              price: brandPrices[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 120,
                                      child: Image.asset(
                                        shoeImages[index],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      brandNames[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    brandDescriptions[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    brandPrices[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }
}