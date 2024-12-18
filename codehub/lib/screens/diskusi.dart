import 'package:flutter/material.dart';

class DiskusiScreen extends StatelessWidget {
  const DiskusiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum Diskusi'),
        backgroundColor: const Color(0xff1B3C71),
      ),
      body: const Center(
        child: Text('Selamat datang di Forum Diskusi!',
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      backgroundColor: const Color(0xff001125),
    );
  }
}
