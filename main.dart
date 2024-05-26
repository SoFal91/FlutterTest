import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _outputHistory = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _clear();
    } else if (_isOperator(buttonText)) {
      _handleOperator(buttonText);
    } else if (buttonText == "=") {
      _performCalculation();
    } else {
      _updateOutput(buttonText);
    }

    setState(() {
      _output;
      _outputHistory;
    });
  }

  bool _isOperator(String buttonText) {
    return buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "x";
  }

  void _handleOperator(String buttonText) {
    num1 = double.parse(_output);
    operand = buttonText;
    _outputHistory += _output + buttonText;
    _output = "0";
  }

  void _updateOutput(String buttonText) {
    if (_output == "0") {
      _output = buttonText;
    } else {
      _output += buttonText;
    }
  }

  void _clear() {
    _output = "0";
    _outputHistory = "";
    num1 = 0.0;
    num2 = 0.0;
    operand = "";
  }

  void _performCalculation() {
    num2 = double.parse(_output);
    if (operand == "+") {
      _output = (num1 + num2).toString();
    } else if (operand == "-") {
      _output = (num1 - num2).toString();
    } else if (operand == "x") {
      _output = (num1 * num2).toString();
    } else if (operand == "/") {
      _output = (num1 / num2).toString();
    }
    num1 = 0.0;
    num2 = 0.0;
    operand = "";
    _outputHistory = "";
  }

  Widget _buildButton(String buttonText, int index) {
    return Expanded(
      child: ElevatedButton(
        key: Key('button_${buttonText}_$index'),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _outputHistory,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton("7", 1),
                    _buildButton("8", 2),
                    _buildButton("9", 3),
                    _buildButton("/", 4),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("4", 5),
                    _buildButton("5", 6),
                    _buildButton("6", 7),
                    _buildButton("x", 8),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("1", 9),
                    _buildButton("2", 10),
                    _buildButton("3", 11),
                    _buildButton("-", 12),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton(".", 13),
                    _buildButton("0", 14),
                    _buildButton("C", 15),
                    _buildButton("+", 16),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("=", 17),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
