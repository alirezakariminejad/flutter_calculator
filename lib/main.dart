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
                        getRowClaculator(),
                        getRowClaculator(),
                        getRowClaculator(),
                        getRowClaculator(),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRowClaculator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '1',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, color: textGray),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '2',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, color: textGray),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '3',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, color: textGray),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            '+',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, color: textGray),
          ),
        ),
      ],
    );
  }
}
