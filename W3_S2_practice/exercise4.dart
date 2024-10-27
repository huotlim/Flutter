import 'package:flutter/material.dart';

// Abstract class defining the interface
abstract class AbstractWidget {
  AbstractWidget({this.id});
  final int? id;

  Widget build(); 
}

// CustomCard class implementing AbstractWidget
class CustomCard extends AbstractWidget {
  final String text;
  final Color? color;

  CustomCard({required this.text, this.color, super.id});

  @override
  Widget build() {
    return Container(
      width: 500, 
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: color, // Default to transparent if color is null
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
          
            children: [
              // Create instances of CustomCard and call the build method
              CustomCard(
                text: "OOP",
                color: Colors.blue[100],
              ).build(), // Call build() to get the Widget
              CustomCard(
                text: "DART",
                color: Colors.blue[300],
              ).build(),
              CustomCard(
                text: "FLUTTER",
                color: Colors.blue[600],
              ).build(),
            ],
          ),
        ),
      ),
    ),
  );
}
