import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final String text;

  const NewWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 16), // Adds margin-bottom for spacing
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20), // Use passed icon
          Padding(
            padding: EdgeInsets.only(left: 10), // Adds left margin to the text
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
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
        body: Padding(
          padding: EdgeInsets.all(16.0), // Add padding around the Column
          child: Center(
            child: Column(
               // Center the column
              children: [
                NewWidget(
                  color: Colors.green[500],
                  icon: Icons.travel_explore,
                  text: "Travelling",
                ),
                NewWidget(
                  color: Colors.grey,
                  icon: Icons.skateboarding,
                  text: "Skating",
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
