import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 127, 120),
       // Moved backgroundColor here
      body: Padding(
       
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            for (int i = 0; i < colors.length; i++) Text(colors[i]),
            const Label("Method 2: Map", bold: true),
            ...colors.map((item) => Text(item)).toList(),
            const Label("Method 3: Dedicated Function", bold: true),
            ...getColor(),
          ],
        ),
      ),
    ),
  ));
}

const List<String> colors = ["red", "blue", "green"];

List<Widget> getColor() {
  return colors.map((item) => Text(item)).toList();
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      style: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
