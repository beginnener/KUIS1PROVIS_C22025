import 'package:flutter/material.dart';
import 'mental.dart';
import 'main.dart';
import 'elearning.dart';
import 'chat.dart';
import 'keuangan.dart';
import 'notifikasi.dart';
import 'sosmed.dart';
import 'todo.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MentalHealthScreen(),
//     );
//   }
// }

class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.black),
            ),
            SizedBox(width: 10),
            Text("Halo, Futih Milati", style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.purple,
            child: Column(
              children: [
                Text(
                  "How are you today?",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.sentiment_very_satisfied, color: Colors.yellow, size: 40),
                    Icon(Icons.sentiment_satisfied, color: Colors.white, size: 40),
                    Icon(Icons.sentiment_neutral, color: Colors.white, size: 40),
                    Icon(Icons.sentiment_dissatisfied, color: Colors.white, size: 40),
                    Icon(Icons.sentiment_very_dissatisfied, color: Colors.white, size: 40),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.white, size: 30),
                          SizedBox(width: 10),
                          Text(
                            "Hotline Layanan Kesehatan Mental\nKamu tidak sendiri!",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.favorite, color: Colors.pink, size: 30),
                                Text("Heart Rate\n120 bpm", textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.nightlight_round, color: Colors.yellow, size: 30),
                                Text("Sleep\n7 Jam 21 Menit", textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Meditation", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _meditationButton("Focus", Icons.psychology),
                        _meditationButton("Anxious", Icons.eco),
                        _meditationButton("Balance", Icons.self_improvement),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.air, color: Colors.white, size: 40),
                          Text(
                            "Breath\nSlow down and take a deep breath.. this breathing exercise might help you",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
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

  Widget _meditationButton(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple[300],
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
