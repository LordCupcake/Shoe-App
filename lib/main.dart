import 'package:flutter/material.dart';

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
    'assets/shoes/shoe1.jpg',
    'assets/shoes/shoe2.jpg',
    'assets/shoes/shoe3.jpg',
    'assets/shoes/shoe4.jpg',
    'assets/shoes/shoe5.jpg',
    'assets/shoes/shoe6.jpg',
  ];

  final List<String> brandNames = [
    'Purple',
    'White',
    'Blue',
    'Pink',
    'Black',
    'RedYellowBlue',
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
      appBar: AppBar(
        title: Text('Shoe Shop'),
        centerTitle: true,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: shoeImages.length,
          itemBuilder: (context, index) {
            return Card( 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          shoeImages[index],
                          fit: BoxFit.cover,
                        ),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            brandNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            brandPrices[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                       
                    ),
                  ],
                ),
            );
          },

        ),
      );
  }
}