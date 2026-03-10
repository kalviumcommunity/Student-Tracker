import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  const StateManagementDemo({super.key});

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Color bgColor = _counter >= 5 ? Colors.greenAccent : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management Demo"),
      ),

      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "Button Press Count",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 10),

              Text(
                "$_counter",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Text("Increment"),
                  ),

                  const SizedBox(width: 15),

                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: const Text("Decrement"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}