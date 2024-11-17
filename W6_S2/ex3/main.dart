import 'package:flutter/material.dart';
import 'screen/temperature.dart';
import 'screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen = Welcome(changeScreen: switchScreen);
  }

  void switchScreen() {
    setState(() {
      if (currentScreen is Welcome) {
        currentScreen = Temperature(changeScreen: switchScreen);
      } else {
        currentScreen = Welcome(changeScreen: switchScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
