import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CounterToggle(),
        ),
      ),
    );
  }
}

class CounterToggle extends StatefulWidget {
  const CounterToggle({super.key});

  @override
  State<CounterToggle> createState() => _CounterToggleState();
}

class _CounterToggleState extends State<CounterToggle> {
  bool showCounter = false;

  void _toggleCounter() {
    setState(() {
      showCounter = !showCounter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _toggleCounter,
          child: Text(showCounter ? 'Hide Counter' : 'Show Counter'),
        ),
        const SizedBox(height: 20),
        showCounter ? const Counter() : const SizedBox.shrink(),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() {
    print('createState() called');
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int count = 0;

  void _increment() {
    setState(() {
      count++;
    });
  }

  void _reset() {
    setState(() {
      count = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState() called');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate() called');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose() called');
  }

  @override
  Widget build(BuildContext context) {
    print('build() called');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Count: $count',
          style: const TextStyle(fontSize: 24),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _increment,
              child: const Text('Increment'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }
}
