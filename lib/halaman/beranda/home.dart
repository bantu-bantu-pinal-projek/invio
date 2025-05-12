import 'package:flutter/material.dart';
import '../../komponen/navbar/navbar_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder KSize values (replace with actual constants if available)
    const double margin4x = 24.0;
    const double margin2x = 12.0;
    const double radiusDefault = 18.0;
    const double fontSizeL = 20.0;
    const double fontSizeM = 16.0;
    const double fontSizeS = 14.0;
    const double iconM = 28.0;
    const double buttonHeight = 56.0;
    const Color blue = Color(0xFF3866F2);
    const Color lightGray = Color(0xFFF1F6FB);
    const Color darkGray = Color(0xFF374151);
    const Color borderGray = Color(0xFFE5E7EB);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: margin4x,
                vertical: margin2x,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: lightGray,
                          borderRadius: BorderRadius.circular(radiusDefault),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hai,',
                            style: TextStyle(
                              fontSize: fontSizeS,
                              color: darkGray,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Kaleee!',
                            style: TextStyle(
                              fontSize: fontSizeM,
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/pengaturan.png',
                      width: iconM,
                      height: iconM,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Main Information Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin4x),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(radiusDefault),
                ),
                padding: const EdgeInsets.all(margin4x),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hari ini',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeL,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '4 Mei',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: fontSizeM,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: margin2x),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Total Pinjaman',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeS,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Status Aktif',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSizeS,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: margin4x),
            // Search Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin4x),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radiusDefault),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari',
                    hintStyle: TextStyle(
                      color: borderGray,
                      fontSize: fontSizeM,
                    ),
                    prefixIcon: Icon(Icons.search, color: borderGray),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radiusDefault),
                      borderSide: BorderSide(color: borderGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radiusDefault),
                      borderSide: BorderSide(color: borderGray),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: margin4x),
            // Quick Access
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin4x),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Akses Cepat',
                  style: TextStyle(
                    fontSize: fontSizeM,
                    fontWeight: FontWeight.bold,
                    color: darkGray,
                  ),
                ),
              ),
            ),
            const SizedBox(height: margin2x),
            // Quick Access List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: margin4x),
                child: ListView(
                  children: [
                    _QuickAccessTile(
                      icon: 'assets/icons/kotak.png',
                      label: 'Ajukan Pinjaman',
                    ),
                    const SizedBox(height: margin2x),
                    _QuickAccessTile(
                      icon: 'assets/icons/invent.png',
                      label: 'Lihat Inventaris',
                    ),
                    const SizedBox(height: margin2x),
                    _QuickAccessTile(
                      icon: 'assets/icons/jam.png',
                      label: 'Riwayat Pinjaman',
                    ),
                    const SizedBox(height: margin2x),
                    _QuickAccessTile(
                      icon: 'assets/icons/sedih.png',
                      label: 'Keluhan',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}

class _QuickAccessTile extends StatelessWidget {
  final String icon;
  final String label;

  const _QuickAccessTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    // Placeholder KSize values (replace with actual constants if available)
    const double fontSizeM = 16.0;
    const double iconM = 28.0;
    const Color darkGray = Color(0xFF374151);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      height: 64,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // sharp corners
          ),
          padding: EdgeInsets.zero,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset(icon, width: iconM, height: iconM),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSizeM,
                color: darkGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
