import 'package:flutter/material.dart';
import 'package:flutter_calculator_application/constants/constants.dart';
import 'package:math_expressions/math_expressions.dart';

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
  var inputUser = '';
  var result = '0';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        inputUser,
                        style: TextStyle(
                          color: textGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        result,
                        style: TextStyle(
                          color: textGray,
                          fontWeight: FontWeight.bold,
                          fontSize: 72.0,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
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

  void buttonPressed(String text) {
    setState(() {
      inputUser += text;
    });
  }

  Widget getRowClaculator(
      String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(
                  width: 0.0,
                  color: Colors.transparent,
                ),
              ),
              backgroundColor: getBackgroundColor(text1)),
          onPressed: () {
            if (text1 == 'ac') {
              setState(() {
                inputUser = '';
                result = '0';
              });
            } else {
              buttonPressed(text1);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, color: getforgroundColor(text1)),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(
                width: 0.0,
                color: Colors.transparent,
              ),
            ),
            backgroundColor: getBackgroundColor(text2),
          ),
          onPressed: () {
            if (text2 == 'ce') {
              setState(() {
                if (inputUser.length > 0) {
                  inputUser = inputUser.substring(0, inputUser.length - 1);
                }
              });
            } else {
              buttonPressed(text2);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, color: getforgroundColor(text2)),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(
                width: 0.0,
                color: Colors.transparent,
              ),
            ),
            backgroundColor: getBackgroundColor(text3),
          ),
          onPressed: () {
            buttonPressed(text3);
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, color: getforgroundColor(text3)),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(
                width: 0.0,
                color: Colors.transparent,
              ),
            ),
            backgroundColor: getBackgroundColor(text4),
          ),
          onPressed: () {
            if (text4 == '=') {
              Parser parser = new Parser();
              Expression expression = parser.parse(inputUser);
              ContextModel contextModel = ContextModel();
              double eval =
                  expression.evaluate(EvaluationType.REAL, contextModel);

              setState(() {
                result = eval.toString();
              });
            } else {}
            buttonPressed(text4);
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text4,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.0, color: getforgroundColor(text4)),
            ),
          ),
        ),
      ],
    );
  }

  bool isOperator(String text) {
    var listOperators = ['ac', 'ce', '%', '/', '*', '-', '+', '='];
    for (var operator in listOperators) {
      if (operator == text) {
        return true;
      }
    }
    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOperator(text)) {
      return backgroundGrayDark;
    } else {
      return backgroundGray;
    }
  }

  Color getforgroundColor(String text) {
    if (isOperator(text)) {
      return textGreen;
    } else {
      return textGray;
    }
  }
}
