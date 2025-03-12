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
      home: const FinanceScreen(),
    );
  }
}

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Your Balance Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Your balance",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 8),
                  const Text("Rp. 789.500,00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Income & Expense Section
            Row(
              children: [
                _buildIncomeExpenseCard("Income", "Rp. 252.000,00",
                    Icons.arrow_downward, Colors.purple),
                const SizedBox(width: 8),
                _buildIncomeExpenseCard("Expense", "Rp. 42.000,00",
                    Icons.arrow_upward, Colors.purple.shade300),
              ],
            ),
            const SizedBox(height: 16),

            // Your Wallet Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Your Wallet",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("+ Add new")),
              ],
            ),

            // Wallet Grid
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              children: [
                _buildWalletCard("Rp. 252.000", "Food", Icons.fastfood,
                    Colors.deepPurple.shade900),
                _buildWalletCard("Rp. 252.000", "Clothing", Icons.shopping_cart,
                    Colors.purple.shade200),
                _buildWalletCard("Rp. 252.000", "Pets", Icons.pets,
                    Colors.purple.shade400),
              ],
            ),
            const SizedBox(height: 16),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Transaction",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("See all")),
              ],
            ),
            const SizedBox(height: 8),

            // Tabs: Weekly | Monthly | Yearly
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab("Weekly", true),
                  _buildTab("Monthly", false),
                  _buildTab("Yearly", false),
                ],
              ),
            ),
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

  // Widget untuk kartu Income & Expense
  Widget _buildIncomeExpenseCard(
      String title, String amount, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white)),
                Text(amount,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }

  // Widget untuk kartu Wallet
  Widget _buildWalletCard(String amount, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 8),
          Text(amount,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  // Widget untuk Tab di Recent Transactions
  Widget _buildTab(String title, bool isSelected) {
    return Text(
      title,
      style: TextStyle(
          color: isSelected ? Colors.white : Colors.white54,
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
    );
  }
}
