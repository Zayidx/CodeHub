import 'package:flutter/material.dart';

class PemrogramanHTML extends StatelessWidget {
  const PemrogramanHTML({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTML Programming"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          "Selamat datang di halaman HTML!",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
