import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            children: [
              Container(
                width: 500,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.blue[100],
                ),
                alignment: Alignment.center,
                child: const Text(
                  "OOP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.blue[300],
                ),
                alignment: Alignment.center,
                child: const Text(
                  "DART",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.blue[300],
                ),
                alignment: Alignment.center,
                child: const Text(
                  "FLUTTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 157, 187, 24),
                      Color.fromARGB(177, 3, 49, 165),
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "FLUTTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
