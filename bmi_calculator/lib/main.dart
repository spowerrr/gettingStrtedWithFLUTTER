import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String? _bmiResult;
  String? _interpretation;

  void _calculateBMI() {
    if (_heightController.text.isEmpty || _weightController.text.isEmpty) {
      setState(() {
        _bmiResult = "Please enter values!";
        _interpretation = "";
      });
      return;
    }

    try {
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);

      if (height <= 0 || weight <= 0) {
        setState(() {
          _bmiResult = "Invalid input. Enter positive values.";
          _interpretation = "";
        });
        return;
      }

      double bmi = weight / (height * height) * 10000;
      setState(() {
        _bmiResult = bmi.toStringAsFixed(2);
        _interpretateBMI(bmi);
      });
    } catch (e) {
      setState(() {
        _bmiResult = "Invalid input. Please enter numeric values.";
        //_interpretation = "";
      });
    }
  }

  void _interpretateBMI(double bmi) {
    String interpretation;
    if (bmi >= 30) {
      interpretation = 'Obese';
    } else if (bmi >= 25) {
      interpretation = 'Overweight';
    } else if (bmi >= 18.5) {
      interpretation = 'Normal weight';
    } else {
      interpretation = 'Underweight';
    }
    setState(() {
      _interpretation = interpretation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Height (cm)'),
                cursorColor: Colors.red,
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: const Text('Calculate BMI'),
              ),
              const SizedBox(height: 20),
              Text(
                _bmiResult != null ? 'Your BMI: $_bmiResult' : '',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                _interpretation != null
                    ? 'Interpretation: $_interpretation'
                    : '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
