import 'package:flutter/material.dart';

List<String> imageUrls = [
  "https://m.media-amazon.com/images/I/71YG+VrvrTL._AC_UF894,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/71f5Eu5lJSL._AC_UF894,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/71h-tsPzk5L._AC_UF894,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/719C6bJv8jL._AC_UF894,1000_QL80_.jpg"
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    ));

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 0;

  void showPreviousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + imageUrls.length) % imageUrls.length;
    });
  }

  void showNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Previous Image',
            onPressed: showPreviousImage,
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next Image',
            onPressed: showNextImage,
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          imageUrls[currentIndex],
        ),
      ),
    );
  }
}
