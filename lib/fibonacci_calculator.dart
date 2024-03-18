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
                  _result = fibonacci(position - 1);
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

  Map<int, int> cache = {};

  int fibonacci(int n) {
    if (n <= 0) {
      return 0;
    } else if (n == 1 || n == 2) {
      return 1;
    } else {
      if (cache.containsKey(n)) {
        return cache[n]!;
      } else {
        cache[n] = (fibonacci(n - 1) + fibonacci(n - 2));
        return cache[n]!;
      }
    }
  }
}
//0+0=0
//0+1=1
//1+0=1
//1+1=2
//1+2=3
//2+3=5
//3+5=8
//5+8=13
//8+13=21
//13+21=34
//21+34=55
//34+55=89
