import 'package:flutter/material.dart';
import '../../komponen/navbar/navbar_bottom.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Navigate to edit profile page
                      },
                      child: const Text(
                        'edit',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Profile Photo
            Center(
              child: CircleAvatar(
                radius: 54,
                backgroundImage: AssetImage('assets/images/foto profile.png'),
              ),
            ),
            const SizedBox(height: 24),
            // Basic Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _ProfileInfoRow(label: 'Nama', value: 'Muhammad Yusuf'),
                  const Divider(height: 1),
                  _ProfileInfoRow(
                    label: 'Email',
                    value: 'yusuf06@gmail.com',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Account Information Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Informasi akun',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[900],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Account Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _ProfileInfoRow(label: 'Nomor HP', value: '082279248617'),
                  const Divider(height: 1),
                  _ProfileInfoRow(label: 'Nama ID', value: 'yusuf06'),
                  const Divider(height: 1),
                  _ProfileInfoRow(label: 'Tanggal Daftar', value: '13/04/2025'),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(activeIndex: 3),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                color:
                    label == 'Nama' || label == 'Email'
                        ? Colors.grey
                        : Colors.grey[500],
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 22),
        ],
      ),
    );
  }
}
