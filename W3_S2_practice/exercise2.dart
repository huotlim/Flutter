import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        
          color: Colors.blue[300],
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(40),
          child: Container(
             // Inner padding of 40px
            decoration: BoxDecoration(
              color: Colors.blue[600], 
              borderRadius: BorderRadius.circular(10),  
            ),
            child: Center(
              child: Text(
                "CADT STUDENTS",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        
      ),
    );
  }
}
