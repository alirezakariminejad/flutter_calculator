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
                  color: backgroundGrayDark,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    color: backgroundGray,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getRowClaculator('ac', 'ce', '%', '/'),
                        getRowClaculator('7', '8', '9', '*'),
                        getRowClaculator('4', '5', '6', '-'),
                        getRowClaculator('1', '2', '3', '+'),
                        getRowClaculator('00', '0', '.', '='),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRowClaculator(
      String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, color: textGray),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, color: textGray),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, color: textGray),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text4,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, color: textGray),
            ),
          ),
        ),
      ],
    );
  }
}
