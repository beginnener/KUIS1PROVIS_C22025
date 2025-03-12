import 'package:flutter/material.dart';
import 'mental.dart';
import 'akademik.dart';
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
      title: "App test",
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    Widget destination;
    switch (index) {
      case 0:
        destination = const AkademikScreen();
        break;
      case 1:
        destination = const ELearningScreen();
        break;
      case 2:
        destination = const HomeScreen();
        break;
      case 3:
        destination = const ToDoScreen();
        break;
      case 4:
        destination = const SocialMediaScreen();
        break;
      default:
        destination = const HomeScreen();
    }

    // Gunakan pushReplacement agar tidak menumpuk stack
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
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
            Container(height: 150, color: Colors.grey[300]),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                );
              }),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MentalHealthScreen()),
                        );
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Bantuan Kesehatan Mental',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FinanceScreen()),
                        );
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Dompet Mahasiswa',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon/academic.png')),
              label: 'Akademik'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon/book.png')),
              label: 'E-Learning'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon/home.png')),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon/calendar.png')),
              label: 'To-Do'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icon/socmed.png')),
              label: 'Socmed'),
        ],
      ),
    );
  }
}
