import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set fullscreen mode inside initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff002095),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
          color: const Color(0xffffffff),
        ),
        title: const Text(
          'Code Hub',
          style: TextStyle(
            color: Color(0xffffffff), // Warna teks putih
            fontSize: 20, // Ukuran teks (opsional)
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Selected: ${_selectedIndex == 0 ? "Calls" : _selectedIndex == 1 ? "Camera" : _selectedIndex == 2 ? "Chats" : "Mail"}',
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff002095),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Icons.apps),
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Icons.edit_note_sharp),
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Icons.notifications),
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Icons.mail),
            ),
            label: 'Mail',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        selectedIconTheme: const IconThemeData(
          size: 24, // Ukuran ikon saat dipilih
        ),
        unselectedIconTheme: const IconThemeData(
          size: 28, // Ukuran ikon saat tidak dipilih
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 14, // Ukuran label saat dipilih
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 0, // Sembunyikan label saat tidak dipilih
        ),
      ),
    );
  }
}
