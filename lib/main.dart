import 'package:flutter/material.dart';
import 'package:flutter_calculator_application/constants/constants.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'gilroy'),
      home: Scaffold(
        backgroundColor: backgroundGrayDark,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 150.0,
                color: backgroundGrayDark,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: 150.0,
                color: backgroundGray,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
