import 'package:flutter/material.dart';
import 'mental.dart';
import 'main.dart';
import 'elearning.dart';
import 'chat.dart';
import 'keuangan.dart';
import 'notifikasi.dart';
import 'sosmed.dart';
import 'todo.dart';

class AkademikScreen extends StatefulWidget {
  const AkademikScreen({super.key});

  @override
  State<AkademikScreen> createState() => _AkademikScreenState();
}

class _AkademikScreenState extends State<AkademikScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AkademikScreen(),
    const ELearningScreen(),
    const HomeScreen(),
    const ToDoScreen(),
    const SocialMediaScreen(),
  ];

  void _onItemTapped(int index) {
    if (index != _currentIndex) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _screens[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset('assets/icon/profile.png', width: 24, height: 24),
            ),
            const SizedBox(width: 8),
            const Text('Halo, Futih Millati'),
            const Spacer(),
            IconButton(
              icon: Image.asset('assets/icon/notification.png', width: 24, height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/icon/chat.png', width: 24, height: 24),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GroupsAndChatsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.purple,
              child: const Text(
                "\ud83d\udce2 Pengumuman perpanjangan pembayaran UKT, baca selengkapnya",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),
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
                          Text("SKS Diperoleh", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 8),
                          Text("65 SKS", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
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
                          Text("Perolehan IPK", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 8),
                          Text("3,80", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildGraphCard("Tren IP"),
            const SizedBox(height: 16),
            _buildGraphCard("Perolehan Nilai"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
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
