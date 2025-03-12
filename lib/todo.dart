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
      home: const ToDoScreen(),
    );
  }
}

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tasks = [
      {
        "title": "Kuis Provis 1",
        "date": "Rabu, 12 Maret 2025",
        "time": "10.00 WIB",
      },
      {
        "title": "Kuis Provis 1",
        "date": "Rabu, 12 Maret 2025",
        "time": "10.00 WIB",
      },
      {
        "title": "Kuis Provis 1",
        "date": "Rabu, 12 Maret 2025",
        "time": "10.00 WIB",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "To Do’s",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
            ),
          ),

          // Header User Greeting
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo, Futih Milati",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "ada apa hari ini?",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          // Task Categories
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategory("Recently"),
                _buildCategory("Today"),
                _buildCategory("Upcoming"),
                _buildCategory("Later"),
              ],
            ),
          ),

          // Task List
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var task = tasks[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Colors.purple),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today, color: Colors.black),
                    title: Text(
                      task["title"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("${task["date"]}\n${task["time"]}"),
                    trailing: const Icon(Icons.more_vert),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, size: 32, color: Colors.white),
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

  // Function to Build Category Widget
  Widget _buildCategory(String title) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.purple),
          ),
          child: const Center(
            child: Text(
              "Lorem Ipsum",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
