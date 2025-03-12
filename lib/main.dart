import 'package:flutter/material.dart';
import 'mental.dart';

// halooooooooo
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0; // Untuk menentukan item aktif

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App test",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                  child: Image.asset('assets/icon/profile.png',
                      width: 24, height: 24)),
              const SizedBox(width: 8),
              const Text('Halo, Futih Millati'),
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
            Container(
              height: 150,
              color: Colors.grey[300],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: CircleAvatar(radius: 4, backgroundColor: Colors.grey),
              )),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) => GestureDetector(
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
                              'Mental Health',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType
              .fixed, // Penting untuk menampilkan semua label
          currentIndex: _currentIndex, // Tentukan index item yang aktif
          selectedItemColor: Colors.blue, // Warna untuk item aktif
          unselectedItemColor: Colors.grey, // Warna untuk item tidak aktif
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
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
      ),
    );
  }
}
