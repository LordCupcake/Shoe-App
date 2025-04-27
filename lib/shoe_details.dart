import 'package:flutter/material.dart';

class ShoeDetailsPage extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String price;
  final List<String> angles; 

  ShoeDetailsPage({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.angles, 
  });

  @override
  _ShoeDetailsPageState createState() => _ShoeDetailsPageState();
}

class _ShoeDetailsPageState extends State<ShoeDetailsPage> {
  int selectedSizeIndex = 37; 
  int selectedMeasurementIndex = 0; 
  bool isReadMore = false; 
  int selectedAngleIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> allAngles = [widget.image, ...widget.angles];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    allAngles[selectedAngleIndex],
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // angle cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(allAngles.length, (index) {
                    final img = allAngles[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAngleIndex = index;
                        });
                      },
                      child: Card(
                        elevation: selectedAngleIndex == index ? 6 : 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            img,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.price,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                widget.description,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey[200], 
                thickness: 1.5, 
              ),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isReadMore
                        ? 'This shoe is designed for maximum comfort and durability. It features a lightweight design, breathable material, and a stylish look perfect for any occasion.'
                        : 'This shoe is designed for maximum comfort and durability. It features a lightweight design, breathable material, and a stylish look perfect for any occasion.'.substring(0, 100) + '...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isReadMore = !isReadMore; 
                      });
                    },
                    child: Text(
                      isReadMore ? 'Read Less' : 'Read More',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, 
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey[200],
                thickness: 1.5,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Size',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMeasurementIndex = 0; 
                          });
                        },
                        child: Text(
                          'EUR',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedMeasurementIndex == 0 ? FontWeight.bold : FontWeight.normal,
                            color: selectedMeasurementIndex == 0 ? Colors.black : Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMeasurementIndex = 1; 
                          });
                        },
                        child: Text(
                          'UK',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedMeasurementIndex == 1 ? FontWeight.bold : FontWeight.normal,
                            color: selectedMeasurementIndex == 1 ? Colors.black : Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMeasurementIndex = 2; 
                          });
                        },
                        child: Text(
                          'US',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedMeasurementIndex == 2 ? FontWeight.bold : FontWeight.normal,
                            color: selectedMeasurementIndex == 2 ? Colors.black : Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(8, (index) {
                    int size = 37 + index; 
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSizeIndex = size; 
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10), 
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        decoration: BoxDecoration(
                          color: selectedSizeIndex == size ? Colors.black : Colors.white,
                          border: Border.all(
                            color: selectedSizeIndex == size ? Colors.black : Colors.grey[300]!,
                            width: 2.0, 
                          ),
                          borderRadius: BorderRadius.circular(8), 
                        ),
                        child: Text(
                          size.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: selectedSizeIndex == size ? Colors.white : Colors.grey[500],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: TextButton(
          onPressed: () {
            
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 14.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'ADD TO CART',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
