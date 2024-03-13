import 'package:flutter/material.dart';

class FibonacciCalculator extends StatefulWidget {
  const FibonacciCalculator({super.key});

  @override
  State<FibonacciCalculator> createState() => _FibonacciCalculatorState();
}

class _FibonacciCalculatorState extends State<FibonacciCalculator> {
  final TextEditingController _inputController = TextEditingController();
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fibonacci Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a position',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int position = int.tryParse(_inputController.text) ?? 0;
                  _result = fibonacci(position);
                });
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Fibonacci at position ${_inputController.text}: $_result',
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  int fibonacci(int n) {
    if (n <= 1) {
      return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}
