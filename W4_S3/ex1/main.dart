import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Selectable Button Example'),
      ),
      body: Center( 
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: SelectableButton(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: SelectableButton(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: SelectableButton(),
            ),
             Container(
              margin: EdgeInsets.all(10),
              child: SelectableButton(),
            ),
          ],
        ),
      ),
    ),
  ));
}

class SelectableButton extends StatefulWidget {
  @override
  SelectableButtonState createState() => SelectableButtonState();
}

class SelectableButtonState extends State<SelectableButton> {
  bool _isSelected = false;

  void forSelection() {
    setState(() {
      _isSelected = !_isSelected; 
    });
  }
  String get buttonText => _isSelected ? 'Selected' : 'Not Selected';
  Color get textColor => _isSelected ? Colors.white : Colors.black;
  Color get buttonColor => _isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: forSelection, 
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, 
        ),
        child: Center(
          child: Text(buttonText, 
            style: TextStyle(
              color: textColor, 
            ),
          ),
        ),
      ),
    );
  }
}
