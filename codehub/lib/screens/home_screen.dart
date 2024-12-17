import 'package:codehub/screens/pemograman.dart';
import 'package:flutter/material.dart';
import 'administrator.dart';
import 'notifikasi.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeHub',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const NotifikasiPage(),
    const Placeholder(), // Placeholder for "Masukan" popup
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _showSupportPopup();
    } else if (index == 1) {
      // Navigasi ke NotifikasiPage sebagai halaman baru
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotifikasiPage()),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _showSupportPopup() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xff1B3C71),
        title: const Text('Dukungan & Bantuan',
            style: TextStyle(color: Colors.white)),
        content: const Text(
          'Silahkan berikan masukan atau saran anda untuk aplikasi ini agar lebih berkembang. Mohon jika menemukan bug / kerusakan pada aplikasi ini segera beritahu kami disini. Terima kasih.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Tidak', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              final Uri url = Uri.parse('https://wa.me/6283129701342');
              if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
                print('Launching WhatsApp...');
              } else {
                throw 'Could not launch $url';
              }
            },
            child: const Text('KIRIM', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff000a52),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/codehub-logo.png', // Replace with the path to your logo image
            height: 24, // Set height of the logo as per your requirement
          ),
        ),
        title: const Text(
          'CodeHub',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff002095),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Masukan',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showPopup(BuildContext context, String message,
      {double fontSize = 14.0,
      double borderRadius = 12.0,
      Color bgColor = const Color(0xff1B3C71),
      Color dividerColor = Colors.white}) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent, // Transparan agar border terlihat
        child: Container(
          decoration: BoxDecoration(
            color: bgColor, // Warna latar belakang
            borderRadius: BorderRadius.circular(borderRadius), // Border radius
          ),
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width *
                0.2, // Membatasi lebar 80% dari lebar layar
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Informasi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Ukuran font title
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                message,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: fontSize, // Ukuran font isi pesan
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Container(
                height: 1, // Tinggi garis pembatas
                color: dividerColor, // Warna garis pembatas
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff000a52),
      child: SingleChildScrollView(
        // Tambahkan SingleChildScrollView di sini
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DashBoard',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Belajar pemrograman mudah dari awal',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                'assets/homevector.png', // Gambar yang akan ditambahkan
                width: 500, // Sesuaikan ukuran gambar
                height: 200, // Sesuaikan ukuran gambar
              ),
            ),
            const SizedBox(height: 30),
            // Centered buttons (Informasi and Tools Online)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    // Informasi Button
                    Container(
                      width: double.infinity, // Full width for the button
                      margin: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff003cb0),
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          _showPopup(
                            context,
                            'Terima Kasih telah bergabung bersama kami, CodeHub akan selalu update materi-materi seputar dunia IT dll, aplikasi ini dibuat dengan tujuan menyalurkan semangat anak bangsa untuk memajukan industri IT di semua bidang IT, mohon untuk tidak mengubah konten / memodifikasi / mencuri source code tanpa izin kami, terima kasih...',
                            fontSize: 16.0, // Ukuran font isi pesan
                            borderRadius: 20.0, // Border radius pop-up
                            bgColor:
                                const Color(0xff002095), // Warna background
                          );
                        },
                        child: const Text(
                          'INFORMASI',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // Tools Online Button
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Grid of Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GridView.count(
                shrinkWrap: true, // Tambahkan ini untuk GridView
                physics:
                    const NeverScrollableScrollPhysics(), // Nonaktifkan scroll di dalam GridView
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  // Administrator Card with image
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 2, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Optional: rounded corners
                    ),
                    child: _buildCardWithImage(
                      title: 'Administrator',
                      subtitle: 'Admin room',
                      imagePath:
                          'assets/administration-logo.png', // Path ke gambar Administrator
                      color: const Color(0xff000a52),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdministratorScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  // Pemrograman Card with image
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 2, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Optional: rounded corners
                    ),
                    child: _buildCardWithImage(
                      title: 'Pemrograman',
                      subtitle: 'Programming',
                      imagePath:
                          'assets/pemrograman-logo.png', // Path ke gambar Pemrograman
                      color: const Color(0xff000a52),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PemrogramanPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 2, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Optional: rounded corners
                    ),
                    child: _buildCardWithImage(
                      title: 'Jaringan internet',
                      subtitle: 'Networking',
                      imagePath:
                          'assets/jaringan-logo.png', // Path ke gambar Pemrograman
                      color: const Color(0xff000a52),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PemrogramanPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 2, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Optional: rounded corners
                    ),
                    child: _buildCardWithImage(
                      title: 'Perangkat Lunak',
                      subtitle: 'Software',
                      imagePath:
                          'assets/perangkatlunak-logo.png', // Path ke gambar Pemrograman
                      color: const Color(0xff000a52),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PemrogramanPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 2, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Optional: rounded corners
                    ),
                    child: _buildCardWithImage(
                      title: 'Perangkat Keras',
                      subtitle: 'Hardware',
                      imagePath:
                          'assets/perangkatkeras-logo.png', // Path ke gambar Pemrograman
                      color: const Color(0xff000a52),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PemrogramanPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // White border color
                        width: 2, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Optional: rounded corners
                    ),
                    child: _buildCardWithImage(
                      title: 'Script Terminal',
                      subtitle: 'Terminal Tools',
                      imagePath:
                          'assets/script-logo.png', // Path ke gambar Pemrograman
                      color: const Color(0xff000a52),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PemrogramanPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardWithImage({
    required String title,
    required String subtitle,
    required String imagePath, // Ganti icon dengan path gambar
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 50,
              width: 50,
              errorBuilder: (context, error, stackTrace) {
                return const FlutterLogo(size: 50);
              },
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
