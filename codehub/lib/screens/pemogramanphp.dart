import 'package:flutter/material.dart';

class PemrogramanPHP extends StatelessWidget {
  const PemrogramanPHP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PHP Programming"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          "Selamat datang di halaman PHP!",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
