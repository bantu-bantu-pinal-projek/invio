import 'package:flutter/material.dart';
import '../../halaman/beranda/home.dart';
import '../../halaman/peminjaman/pinjaman.dart';
import '../../halaman/notifikasi/notification.dart';
import '../../halaman/riwayat pinjaman/history.dart';
import '../../halaman/profile/profile.dart';


class BottomNavbar extends StatelessWidget {
  final int activeIndex;
  const BottomNavbar({Key? key, this.activeIndex = -1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Responsive icon size
    double iconSize = MediaQuery.of(context).size.width * 0.08;
    iconSize = iconSize.clamp(28.0, 36.0); // min 28, max 36

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavbarIconButton(
            assetPath:
                activeIndex == 0
                    ? 'assets/icons/rumah-isi.png'
                    : 'assets/icons/rumah.png',
            iconSize: iconSize,
            onTap: () {
              if (activeIndex != 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            },
          ),
          _NavbarIconButton(
            assetPath:
                activeIndex == 1
                    ? 'assets/icons/peti-isi.png'
                    : 'assets/icons/peti.png',
            iconSize: iconSize,
            onTap: () {
              if (activeIndex != 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PinjamanPage()),
                );
              }
            },
          ),
          _NavbarIconButton(
            assetPath: 'assets/icons/jam(3).png',
            iconSize: iconSize,
            onTap: () { 
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
          ),
          _NavbarIconButton(
            assetPath:
                activeIndex == 3
                    ? 'assets/icons/profile-isi.png'
                    : 'assets/icons/profile.png',
            iconSize: iconSize,
            onTap: () {
              if (activeIndex != 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _NavbarIconButton extends StatelessWidget {
  final String assetPath;
  final double iconSize;
  final VoidCallback? onTap;

  const _NavbarIconButton({
    required this.assetPath,
    required this.iconSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Image.asset(
          assetPath,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
