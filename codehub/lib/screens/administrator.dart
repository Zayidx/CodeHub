import 'package:flutter/material.dart';

class AdministratorScreen extends StatelessWidget {
  const AdministratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff000a52),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'CODEHUB',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xff000a52),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo dan Deskripsi
              _buildHeaderSection(),
              const SizedBox(height: 20),
              _buildSectionTitle('DEVELOPERS TEAM'),
              _buildTeamMember('Farid Indrawan', 'Mobile developers'),
              _buildTeamMember('Fiqriansyah Akbar', 'Mobile developers'),
              _buildTeamMember('Rasya Falqi Ghani', 'UI/UX Designer'),
              _buildTeamMember('Irgi Attala Ramadan', 'IT Support'),
              _buildTeamMember('Izaz Ramadani', 'IT Support'),
              const SizedBox(height: 20),
              _buildSectionTitle('Thanks to Support'),
              _buildForumLink('SMKN 1 Kota Bekasi',
                  'Bergabung bersama kami di forum whatsapp'),
              _buildForumLink('Guru Pengajar SMKN 1 Kota Bekasi',
                  'Bergabung bersama kami di forum whatsapp'),
              _buildForumLink('Orang Tua Murid',
                  'Bergabung bersama kami di forum whatsapp'),
              _buildForumLink('Murid - Murid SMKN 1 Kota Bekasi',
                  'Bergabung bersama kami di forum whatsapp'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset('assets/codehub-logo.png', width: 100, height: 100),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CYBERSTUDY',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Aplikasi ini di bangun dengan tujuan untuk menyalurkan semangat anak bangsa agar memajukan industri IT di dalam semua bidang.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTeamMember(String name, String role) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff003cb0),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white, // Warna border putih
            width: 1, // Ketebalan border 1
          ),
        ),
        child: ListTile(
          leading: const Icon(Icons.person, color: Colors.white),
          title: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            role,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForumLink(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff003cb0),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white, // Warna border putih
            width: 1, // Ketebalan border 1
          ),
        ),
        child: ListTile(
          leading:
              const Icon(Icons.supervisor_account_sharp, color: Colors.white),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
