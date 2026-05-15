import 'package:flutter/material.dart';

class Pertemuan3Page extends StatelessWidget {
  const Pertemuan3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 3: Layout & Styling'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Halaman Pertemuan 3 - Layout & Styling',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}