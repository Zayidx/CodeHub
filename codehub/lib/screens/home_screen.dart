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
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Tambahkan kunci

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
      key: _scaffoldKey, // Tetapkan kunci di sini
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan ikon menu default
        backgroundColor: const Color(0xff001125),
        title: const Text(
          'Code Hub',
          style: TextStyle(
            color: Color(0xffffffff), // Warna teks putih
            fontSize: 20, // Ukuran teks (opsional)
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white, // Atur warna ikon menjadi putih
            onPressed: () {
              _scaffoldKey.currentState
                  ?.openDrawer(); // Gunakan kunci untuk membuka drawer
            },
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: const Color(0xff1B3C71),
        child: ListView(
          children: [
            Image.asset(
              'assets/studyprograming.png',
            ),
            ListTile(
              title: const Text('Code Hub'),
              textColor: Colors.white, // Atur warna teks
              onTap: () {},
            ),
            ListTile(
              title: const Text('item 1'),
              textColor: Colors.white, // Atur warna teks
              onTap: () {},
            ),
            ListTile(
              title: const Text('item 2'),
              textColor: Colors.white, // Atur warna teks
              onTap: () {},
            ),
          ],
        ),
      ),

      body: Container(
        color: const Color(0xff001125), // Menambahkan warna latar belakang
        width: double.infinity,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Pusatkan secara horizontal
          children: [
            Image.asset(
              'assets/studyprograming.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 20, // Memberi jarak antara gambar dan teks
            ),
            Column(
              children: [
                Visibility(
                  visible: _selectedIndex ==
                      2, // Hanya akan tampil jika _selectedIndex == 2
                  child: const Text(
                    "Woii",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Visibility(
                  visible: _selectedIndex ==
                      2, // Hanya akan tampil jika _selectedIndex == 2
                  child: Image.asset(
                    'assets/studyprograming.png',
                    width: 300,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Visibility(
                  visible: _selectedIndex ==
                      0, // Hanya akan tampil jika _selectedIndex == 0
                  child: const Text(
                    "Woii",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Visibility(
                  visible: _selectedIndex ==
                      0, // Hanya akan tampil jika _selectedIndex == 0
                  child: Image.asset(
                    'assets/studyprograming.png',
                    width: 300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Memberi jarak sebelum tombol
            ElevatedButton(
              onPressed: () {
                // Menampilkan dialog ketika tombol ditekan
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Test Alert Dialog"),
                      content: const Text("Ini adalah contoh alert dialog."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Menutup dialog
                          },
                          child: const Text("Tutup"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Test Alert Dialog"),
            ),

            Text(
              'Selected: ${_selectedIndex == 0 ? "Calls" : _selectedIndex == 1 ? "Camera" : _selectedIndex == 2 ? "Chats" : "Mail"}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors
                    .white, // Warna teks agar terlihat di background gelap
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff001125),
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
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff8c8c8c),
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
