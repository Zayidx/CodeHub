import 'package:codehub/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Mengatur mode UI agar fullscreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Menjalankan animasi fade-in
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigasi ke HomeScreen setelah 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff000a52)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 3),
              child: Image.asset(
                'assets/codehub-logo.png',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 100),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xff000a52),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'V0.1',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(height: 10),
            Text(
              'Group CodeHub',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
