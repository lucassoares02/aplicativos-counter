import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int _counter = 0;
  int color = -1;
  List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.grey,
    Colors.purple,
    Colors.orange,
    Colors.brown,
    Colors.yellow,
    Colors.pink
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _updateColor() {
    if (color < 7) {
      setState(() {
        color++;
      });
    } else {
      setState(() {
        color = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color == -1 ? null : colors[color],
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Contador"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _counter > 10
                ? const Text(
                    'Você ultrapassou o limite de 10 pessoas!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                : const Text(
                    'Vamos contar pessoas, o limite é 10!',
                    style: TextStyle(fontSize: 20),
                  ),
            const SizedBox(height: 20),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: _decrementCounter, icon: const Icon(Icons.remove)),
                const SizedBox(width: 20),
                IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _updateColor, child: const Text("Mudar cor"))
          ],
        ),
      ),
    );
  }
}
