import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int sum = 0;
  int diff = 0;
  int prod = 0;
  double quo = 0;

  final TextEditingController add1Controller = TextEditingController();
  final TextEditingController add2Controller = TextEditingController();

  final TextEditingController sub1Controller = TextEditingController();
  final TextEditingController sub2Controller = TextEditingController();

  final TextEditingController mul1Controller = TextEditingController();
  final TextEditingController mul2Controller = TextEditingController();

  final TextEditingController div1Controller = TextEditingController();
  final TextEditingController div2Controller = TextEditingController();

  void clearInputs() {
    setState(() {
      add1Controller.clear();
      add2Controller.clear();
      sub1Controller.clear();
      sub2Controller.clear();
      mul1Controller.clear();
      mul2Controller.clear();
      div1Controller.clear();
      div2Controller.clear();
      sum = 0;
      diff = 0;
      prod = 0;
      quo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Addition Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = $sum'),
              IconButton(
                onPressed: () {
                  setState(() {
                    sum = (int.tryParse(add1Controller.text) ?? 0) +
                        (int.tryParse(add2Controller.text) ?? 0);
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),

          // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: sub1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: sub2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = $diff'),
              IconButton(
                onPressed: () {
                  setState(() {
                    diff = (int.tryParse(sub1Controller.text) ?? 0) -
                        (int.tryParse(sub2Controller.text) ?? 0);
                  });
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),

          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: mul1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" * "),
              Expanded(
                child: TextField(
                  controller: mul2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = $prod'),
              IconButton(
                onPressed: () {
                  setState(() {
                    prod = (int.tryParse(mul1Controller.text) ?? 0) *
                        (int.tryParse(mul2Controller.text) ?? 0);
                  });
                },
                icon: const Icon(Icons.clear),
              ),
            ],
          ),

          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: div1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: div2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = ${quo.toStringAsFixed(2)}'),
              IconButton(
                onPressed: () {
                  setState(() {
                    int divisor = int.tryParse(div2Controller.text) ?? 0;
                    quo = divisor != 0
                        ? (int.tryParse(div1Controller.text) ?? 0) / divisor
                        : 0;
                  });
                },
                icon: const Icon(Icons.horizontal_rule),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: clearInputs,
            child: const Text('Clear Input'),
          ),
        ],
      ),
    );
  }
}
