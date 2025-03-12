import 'package:flutter/material.dart';
import 'mental.dart';
import 'main.dart';
import 'elearning.dart';
import 'chat.dart';
import 'keuangan.dart';
import 'notifikasi.dart';
import 'sosmed.dart';
import 'todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AkademikScreen(),
    );
  }
}

class AkademikScreen extends StatelessWidget {
  const AkademikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                  child: Image.asset('assets/icon/profile.png',
                      width: 24, height: 24)),
              const SizedBox(width: 8),
              const Text('Futih Millati'),
              const Spacer(),
              IconButton(
                icon: Image.asset('assets/icon/notification.png',
                    width: 24, height: 24),
                onPressed: () {},
              ),
              IconButton(
                icon:
                    Image.asset('assets/icon/chat.png', width: 24, height: 24),
                onPressed: () {},
              ),
            ],
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Pengumuman Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.purple,
              child: const Text(
                "📢 Pengumuman perpanjangan pembayaran UKT, baca selengkapnya",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),

            // SKS & IPK
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("SKS Diperoleh",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 8),
                          Text("65 SKS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Perolehan IPK",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 8),
                          Text("3,80",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Menu Navigasi (Rencana Studi, Kalender Akademik, dll.)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildMenuItem(Icons.edit, "Rencana Studi"),
                  _buildMenuItem(Icons.calendar_today, "Kalender Akademik"),
                  _buildMenuItem(Icons.emoji_events, "Prestasi"),
                  _buildMenuItem(Icons.access_time, "Cuti Kuliah"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tren IP
            _buildGraphCard("Tren IP"),
            const SizedBox(height: 16),

            // Perolehan Nilai
            _buildGraphCard("Perolehan Nilai"),
          ],
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Akademik'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'E-Learning'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'To-Do'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Socmed'),
        ],
      ),
    );
  }

  // Widget untuk item menu navigasi
  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  // Widget untuk menampilkan kartu grafik
  Widget _buildGraphCard(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Center(child: Text("<graph here>", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          ],
        ),
      ),
    );
  }
}
