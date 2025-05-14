import 'package:flutter/material.dart';
import '../../komponen/navbar/navbar_bottom.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  // Example notification data
  final List<Map<String, dynamic>> notifications = const [
    {
      'icon': 'assets/icons/notif1.png',
      'iconColor': Color(0xFFFFE066), // bright yellow
      'title': 'peminjaman disetujui',
      'detail': 'Camera sony A7 mark II',
      'time': '15 april 2025 12:00',
    },
    {
      'icon': 'assets/icons/Jam(2).png',
      'iconColor': Color(0xFF183A6D), // dark blue
      'title': 'Pengambilan segera',
      'detail': 'Batas waktu Tripod : 16 april 2025',
      'time': '15 april 2025 11:00',
    },
    {
      'icon': 'assets/icons/ceklis.png',
      'iconColor': Color(0xFF2ECC40), // green
      'title': 'Pengambilan segera',
      'detail': 'Batas waktu Tripod : 16 april 2025',
      'time': '15 april 2025 11:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Notifikasi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: notifications.length,
                separatorBuilder:
                    (context, index) =>
                        const Divider(height: 1, color: Color(0xFFE5E5E5)),
                itemBuilder: (context, index) {
                  final notif = notifications[index];
                  return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: notif['iconColor'].withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              notif['icon'],
                              width: 22,
                              height: 22,
                              color: notif['iconColor'],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notif['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                notif['detail'],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            notif['time'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
