import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

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
            assetPath: 'assets/icons/rumah.png',
            iconSize: iconSize,
          ),
          _NavbarIconButton(
            assetPath: 'assets/icons/peti.png',
            iconSize: iconSize,
          ),
          _NavbarIconButton(
            assetPath: 'assets/icons/notip.png',
            iconSize: iconSize,
          ),
          _NavbarIconButton(
            assetPath: 'assets/icons/propil.png',
            iconSize: iconSize,
          ),
        ],
      ),
    );
  }
}

class _NavbarIconButton extends StatelessWidget {
  final String assetPath;
  final double iconSize;

  const _NavbarIconButton({required this.assetPath, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // No navigation logic for now
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
