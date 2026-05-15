import 'package:flutter/material.dart';

class Pertemuan5Page extends StatefulWidget {
  const Pertemuan5Page({super.key});

  @override
  State<Pertemuan5Page> createState() => _Pertemuan5PageState();
}

class _Pertemuan5PageState extends State<Pertemuan5Page> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5: State Management'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Contoh State Management dengan setState()',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$_counter',
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Tambah Counter'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
    );
  }
}