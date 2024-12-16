import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Notifikasi'),
        backgroundColor: const Color(0xff000a52),
      ),
      body: const Center(
        child: Text(
          'Ini adalah halaman Notifikasi.',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xff000a52),
    );
  }
}
