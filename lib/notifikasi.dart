import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {"type": "follow", "name": "people_1", "status": "Follow back"},
      {"type": "like", "name": "people_2"},
      {"type": "tag", "name": "People #"},
      {"type": "follow", "name": "People #", "status": "Followed"},
      {"type": "like", "name": "People #"},
      {"type": "like", "name": "People #"},
      {"type": "like", "name": "People #"},
      {"type": "follow", "name": "People #", "status": "Followed"},
      {"type": "follow", "name": "people_1", "status": "Follow back"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Dropdown Filter
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: "All",
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.purple),
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: "All", child: Text("All")),
                    DropdownMenuItem(value: "Likes", child: Text("Likes")),
                    DropdownMenuItem(value: "Follows", child: Text("Follows")),
                    DropdownMenuItem(value: "Mentions", child: Text("Mentions")),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ListView Notifications
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: notifications.length,
              separatorBuilder: (_, __) =>
                  const Divider(color: Colors.purple, thickness: 0.5),
              itemBuilder: (context, index) {
                var notification = notifications[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      notification["type"] == "follow"
                          ? Icons.person
                          : notification["type"] == "like"
                              ? Icons.favorite
                              : Icons.alternate_email,
                      color: Colors.black54,
                    ),
                  ),
                  title: Text(
                    "${notification["name"]} ${_getNotificationMessage(notification["type"])}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: notification.containsKey("status")
                      ? ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                notification["status"] == "Follow back"
                                    ? Colors.blue
                                    : Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            notification["status"],
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      : null,
                );
              },
            ),
          ),
        ],
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

  // Fungsi untuk menentukan teks notifikasi
  String _getNotificationMessage(String type) {
    switch (type) {
      case "follow":
        return "is following You";
      case "like":
        return "liked your post";
      case "tag":
        return "tagged you in a post";
      default:
        return "";
    }
  }
}
