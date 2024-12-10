 
 
import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorView(),
    );
  }
}

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final TextEditingController _controller =
      TextEditingController(); 
  double _num1 = 0; 
  double _num2 = 0; 
  String _operator = ""; 
  bool _isNewCalculation =
      false; 


  void _buttonPressed(String value) {
    setState(() {
    
      if (value == "C") {
        _controller.text = "0";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
        _isNewCalculation = false;
      }
    
      else if (value == "<-") {
        if (_controller.text.isNotEmpty) {
          _controller.text =
              _controller.text.substring(0, _controller.text.length - 1);
          if (_controller.text.isEmpty) {
            _controller.text = "0";
          }
        }
      }
      
      else if (value == "+" || value == "-" || value == "*" || value == "/") {
        if (_controller.text.isNotEmpty && _controller.text != "0") {
          _num1 = double.parse(_controller.text);
          _operator = value;
          _controller.text = "0";
          _isNewCalculation = false; 
        }
      }
     
      else if (value == "=") {
        if (_operator.isNotEmpty && _controller.text.isNotEmpty) {
          _num2 = double.parse(_controller.text);

          switch (_operator) {
            case "+":
              _controller.text = (_num1 + _num2).toString();
              break;
            case "-":
              _controller.text = (_num1 - _num2).toString();
              break;
            case "*":
              _controller.text = (_num1 * _num2).toString();
              break;
            case "/":
              _controller.text =
                  _num2 != 0 ? (_num1 / _num2).toString() : "Error";
              break;
          }

          
          _num1 = 0;
          _num2 = 0;
          _operator = "";
          _isNewCalculation =
              true; 
        }
      }
      else {
        if (_controller.text == "0" || _isNewCalculation) {
          _controller.text =
              value; 
          _isNewCalculation =
              false; 
        } else {
          _controller.text += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<String> buttons = [
      "C",
      "*",
      "/",
      "<-",
      "1",
      "2",
      "3",
      "+",
      "4",
      "5",
      "6",
      "-",
      "7",
      "8",
      "9",
      "*",
      "%",
      "0",
      ".",
      "=",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
     
          Container(
            padding: const EdgeInsets.all(13.0),
            alignment: Alignment.centerRight,
            child: TextField(
              controller: _controller,
              enabled: false,
              style: const TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.blue, 
                    width: 2.0, 
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: buttons.map((String button) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _buttonPressed(button);
                  },
                  child: Text(
                    button,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}