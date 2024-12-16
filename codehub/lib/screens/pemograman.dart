import 'package:flutter/material.dart';
import 'pemogramanhtml.dart';
import 'pemogramanphp.dart';
// Tambahkan file halaman lain jika ada

class PemrogramanPage extends StatelessWidget {
  const PemrogramanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data untuk list pemrograman
    final List<Map<String, dynamic>> programmingList = [
      {
        'name': 'PHP',
        'page': const PemrogramanPHP(),
        'icon': Icons.language
      }, // PHP
      {
        'name': 'HTML',
        'page': const PemrogramanHTML(),
        'icon': Icons.web
      }, // HTML
      {'name': 'SQL', 'page': const LockedPage(), 'icon': Icons.storage}, // SQL
      {
        'name': 'JAVA SCRIPT',
        'page': const LockedPage(),
        'icon': Icons.code
      }, // JAVA SCRIPT
      {'name': 'C ++', 'page': const LockedPage(), 'icon': Icons.code}, // C++
      {'name': 'C #', 'page': const LockedPage(), 'icon': Icons.code}, // C#
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PEMOGRAMMAN',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff000a52),
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Colors.white), // Ubah warna panah kembali menjadi putih
      ),
      backgroundColor: const Color(0xff000a52),
      body: ListView.builder(
        itemCount: programmingList.length,
        itemBuilder: (context, index) {
          final item = programmingList[index];
          return Card(
            color: const Color(0xff003cb0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.white,
                width: 1, // Menambahkan border putih dengan ketebalan 2
              ),
              borderRadius: BorderRadius.circular(
                  8), // Mengatur sudut border jika diinginkan
            ),
            child: ListTile(
              leading: Icon(item['icon'],
                  color: Colors
                      .blue), // Menggunakan icon sesuai bahasa pemrograman
              title: Text(
                item['name'],
                style: const TextStyle(color: Color(0xffdcffff), fontSize: 18),
              ),
              subtitle: const Text(
                'Programming',
                style: TextStyle(color: Colors.white54),
              ),
              trailing: item['name'] == 'HTML' || item['name'] == 'PHP'
                  ? const Icon(Icons.arrow_forward_ios,
                      color: Color(0xff94d8ff))
                  : const Icon(Icons.lock, color: Color(0xff94d8ff)),
              onTap: () {
                // Navigasi ke halaman terkait tanpa popup
                if (item['page'] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item['page']),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// Halaman Pengganti Locked Page
class LockedPage extends StatelessWidget {
  const LockedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Locked Page")),
      body: const Center(child: Text("Halaman ini masih dikunci.")),
    );
  }
}
