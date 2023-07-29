import 'package:flutter/material.dart';


class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _output = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        _calculateResult();
      } else if (buttonText == 'C') {
        _clearInput();
      } else if (buttonText == 'DEL') {
        setState() {
          _input = _input.substring(0, _input.length - 1);
        }
      } else {
        _input += buttonText;
      }
    });
  }



  void _calculateResult() {
    double result = 0.0;
    String operator = '';
    String numString = '';

    for (int i = 0; i < _input.length; i++) {
      if (_input[i] == '+' || _input[i] == '-' || _input[i] == 'x' || _input[i] == '/') {
        if (numString.isNotEmpty) {
          double num = double.parse(numString);
          if (operator.isEmpty) {
            result = num;
          } else {
            result = _performOperation(result, num, operator);
          }
          numString = '';
        }
        operator = _input[i];
      } else {
        numString += _input[i];
      }
    }

    if (numString.isNotEmpty) {
      double num = double.parse(numString);
      if (operator.isEmpty) {
        result = num;
      } else {
        result = _performOperation(result, num, operator);
      }
    }

    _output = result.toString();
  }

  double _performOperation(double a, double b, String operator) {
    if (operator == '+') {
      return a + b;
    } else if (operator == '-') {
      return a - b;
    } else if (operator == 'x') {
      return a * b;
    } else if (operator == '/') {
      if (b != 0) {
        return a / b;
      } else {
        return double.infinity;
      }
    }
    return 0.0;
  }

  void _clearInput() {
    _input = '';
    _output = '';
  }

  Widget _buildButton(String buttonText, Color buttoncolor) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(buttonText),
        child: Text(
          buttonText,
          selectionColor: Colors.blueGrey,
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttoncolor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            CircleBorder(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Flutter Calculator')),
      body:
         Column(
          children: [
            Expanded
            (
              child:
               Container(
                  color: Colors.black,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        SizedBox(height: 50.0),
                        Container(
                          color: Colors.black,
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(_input,
                              style:
                                  TextStyle(fontSize: 36.0, color: Colors.white)),
                        ),
                      ])
                      ),),
            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.black,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _output,
                    style: TextStyle(fontSize: 36.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Divider(height: 10.0),
            Container(
              height: 72.0,
              color: const Color.fromARGB(255, 71, 70, 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton('DEL', Colors.green),
                  _buildButton('C', Colors.red),
                  _buildButton('%', Colors.orange),
                  _buildButton('/', Colors.orange),
                ],
              ),
            ),
            Divider(
                height: 10.0, color: const Color.fromARGB(255, 235, 229, 229)),
            Container(
              height: 72.0,
              color: const Color.fromARGB(255, 71, 70, 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton('9', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('8', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('7', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('x', Colors.orange),
                ],
              ),
            ),
            Divider(
                height: 10.0, color: const Color.fromARGB(255, 235, 229, 229)),
            Container(
              height: 72.0,
              color: const Color.fromARGB(255, 71, 70, 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton('6', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('5', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('4', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('-', Colors.orange),
                ],
              ),
            ),
            Divider(
              height: 10.0,
              color: const Color.fromARGB(255, 235, 229, 229),
            ),
            Container(
              height: 72.0,
              color: const Color.fromARGB(255, 71, 70, 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton('3', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('2', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('1', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('+', Colors.orange),
                ],
              ),
            ),
            Divider(
              height: 10.0,
              color: const Color.fromARGB(255, 235, 229, 229),
            ),
            Container(
              height: 72.0,
              color: const Color.fromARGB(255, 71, 70, 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton('0', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('.', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('ans', const Color.fromARGB(255, 235, 229, 229)),
                  _buildButton('=', Color.fromARGB(255, 82, 77, 77)),
                ],
              ),
            ),
          ],
        ),
      
    );
  }
}




