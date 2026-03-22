import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = '0';
  String _output = '0';
  double number1 = 0;
  double number2 = 0;
  String openrand = '';

  buttonPresses(String buttonText){
    if(buttonText=='AC'){
      _output = '0';
      number1  = 0;
      number2 = 0;
      openrand = '';
    }
    else if(buttonText =='+' || buttonText =='-' ||buttonText =='*' || buttonText =='/'){
      number1 = double.parse(output);
      openrand = buttonText;
      _output = '0';


    }
    else if(buttonText =='='){
      number2 = double.parse(output);
      switch(openrand){
        case '+':
        _output = (number1+number2).toString();
        break;
        case '-':
        _output = (number1-number2).toString();
        break;
        case '*':
        _output = (number1*number2).toString();
        break;
        case '/':
        _output = (number1/number2).toString();
        break;
      }
      number1 = 0;
      number2 = 0;
      openrand = '';


    }else{
      _output+=buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator App',
          style: TextStyle(fontSize: 30, color: Colors.amber),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              output,
              style: TextStyle(fontSize: 80, color: Colors.black),
            ),
          ),
          const Expanded(child: Divider(color: Colors.black45)),

          Column(
            children: [
              Row(
                children: [
                  buildButton('7', Colors.grey),
                  buildButton('8', Colors.grey),
                  buildButton('9', Colors.grey),
                  buildButton('/', Colors.orangeAccent),
                ],
              ),
              Row(
                children: [
                  buildButton('4', Colors.grey),
                  buildButton('5', Colors.grey),
                  buildButton('6', Colors.grey),
                  buildButton('*', Colors.orangeAccent),
                ],
              ),
              Row(
                children: [
                  buildButton('1', Colors.grey),
                  buildButton('2', Colors.grey),
                  buildButton('3', Colors.grey),
                  buildButton('-', Colors.orangeAccent),
                ],
              ),
              Row(
                children: [
                  buildButton(',', Colors.grey),
                  buildButton('0', Colors.grey),
                  buildButton('AC', Colors.grey),
                  buildButton('+', Colors.orangeAccent),
                ],
              ),
                Row(
                children: [
                  buildButton('=', Colors.orangeAccent),
                ],
              ),
              SizedBox(height: 70,)

            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
          ),
          onPressed: () {
            buttonPresses(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 70, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
