import 'package:flutter/material.dart';

enum Product {
  dart("Dart", "The best object-oriented language", "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png"),
  flutter("Flutter", "The best mobile widget library", "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png"),
  firebase("Firebase", "The best cloud database", "https://cdn.iconscout.com/icon/free/png-256/free-firebase-logo-icon-download-in-svg-png-gif-file-formats--technology-social-media-vol-3-pack-logos-icons-3030134.png"); // Changed to load from internet

  final String title;
  final String text;
  final String image;

  const Product(this.title, this.text, this.image);
}

class ProductCard extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      width: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset(image, width: 80)
         
          image.startsWith('http')
              ? Image.network(image, width: 80) 
              : Image.asset(image, width: 80), 
          Text(
            title,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 34,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
          title:  Container(
            child: Text("Products"),
          ),
        ),
        backgroundColor: Colors.blue[400],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProductCard(
                image: Product.dart.image,
                title: Product.dart.title,
                text: Product.dart.text,
              ),
              ProductCard(
                image: Product.flutter.image,
                title: Product.flutter.title,
                text: Product.flutter.text,
              ),
              ProductCard(
                image: Product.firebase.image,
                title: Product.firebase.title,
                text: Product.firebase.text,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
