import 'package:flutter/material.dart';
import 'mental.dart';
import 'elearning.dart';
import 'chat.dart';
import 'keuangan.dart';
import 'notifikasi.dart';
import 'sosmed.dart';
import 'todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // Default ke Home

  final List<Widget> _pages = [
    PlaceholderWidget("Academy"), // Gantilah dengan widget yang sesuai
    PlaceholderWidget("E-learning"),
    MentalHealthScreen(), // Home
    PlaceholderWidget("Schedule"),
    PlaceholderWidget("Health"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Academy"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "E-learning"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Health"),
        ],
      ),
    );
  }
}

// Placeholder Widget untuk halaman yang belum dibuat
class PlaceholderWidget extends StatelessWidget {
  final String title;
  PlaceholderWidget(this.title);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset('assets/icon/profile.png', width: 24, height: 24)),
            SizedBox(width: 8),
            Text('Halo, Futih Millati'),
            Spacer(),
            IconButton(
              icon: Image.asset('assets/icon/notification.png', width: 24, height: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/icon/chat.png', width: 24, height: 24),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Mental Health Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
