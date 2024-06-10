import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  bool isDarkMode = false;
  List<String> history = []; // List to store calculation history

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  void clearHistory() {
    setState(() {
      history.clear();
    });
  }

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "CLEAR HISTORY") {
      clearHistory();
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" || // Use "×" for multiplication
        buttonText == "÷") { // Use "÷" for division
      num1 = double.parse(output);

      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "×") {
        _output = (num1 * num2).toString();
      }
      if (operand == "÷") {
        if (num2 != 0) {
          _output = (num1 / num2).toString();
        } else {
          _output = "Error"; // Handle division by zero
        }
      }

      history.add("$num1 $operand $num2 = $_output"); // Add to history

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "sin") {
      _output = sin(double.parse(output) * (pi / 180)).toString();
    } else if (buttonText == "cos") {
      _output = cos(double.parse(output) * (pi / 180)).toString();
    } else if (buttonText == "tan") {
      _output = tan(double.parse(output) * (pi / 180)).toString();
    } else if (buttonText == "√") { // Use "√" for square root
      _output = sqrt(double.parse(output)).toString();
    } else if (buttonText == "log") {
      _output = log(double.parse(output)).toString();
    } else if (buttonText == "ln") {
      _output = (log(double.parse(output)) / log(e)).toString();
    } else if (buttonText == "^") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "^2") { // Square (^2) button
      _output = (double.parse(output) * double.parse(output)).toString();
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, {Color color = Colors.orange, Color textColor = Colors.white}) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          buttonPressed(buttonText);
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(24.0),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(color),
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
        ),
        child: Text(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Scientific Calculator",
            style: TextStyle(color: Colors.lightBlue),
          ),
          backgroundColor: Colors.black,
          actions: [
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  _saveThemePreference(value);
                });
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(
                vertical: 65,
                horizontal: 30,
              ),
              child: Text(
                output,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                  fontSize: 40.0,
                ),
              ),
            ),
            const Expanded(child: Divider()),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      history[index],
                      style: const TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _output = history[index].split('= ')[1];
                        output = _output;
                      });
                    },
                  );
                },
              ),
            ),
            Column(children: [
              Row(children: <Widget>[
                buildButton("sin"),
                buildButton("cos"),
                buildButton("tan"),
                buildButton("√"), // Use "√" for square root
              ]),
              Row(children: <Widget>[
                buildButton("log"),
                buildButton("ln"),
                buildButton("^2"), // Use "÷" for division
                buildButton("÷"), // Square (^2) button
              ]),
              Row(children: <Widget>[
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("×"), // Use "×" for multiplication
              ]),
              Row(children: <Widget>[
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("-"),
              ]),
              Row(children: <Widget>[
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("+"),
              ]),
              Row(children: <Widget>[
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("="),
              ]),
              Row(children: <Widget>[
                buildButton("CLEAR", color: Colors.white, textColor: Colors.orange),
                buildButton("CLEAR HISTORY", color: Colors.white, textColor: Colors.orange),
              ])
            ]),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const CalculatorScreen());