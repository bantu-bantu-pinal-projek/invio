import 'package:flutter/material.dart';
import '../../komponen/navbar/navbar_bottom.dart';

class PinjamanPage extends StatelessWidget {
  const PinjamanPage({Key? key}) : super(key: key);

  // Example data for demonstration
  final List<Map<String, String>> loans = const [
    {
      'itemName': 'Sony A7 Mark II',
      'borrower': 'Mr. Salimin',
      'receivedDate': 'Mon, 04/15/2025',
      'returnedDate': 'Mon, 04/15/2025',
    },
    {
      'itemName': 'Sony A7 Mark II',
      'borrower': 'Mr. Salimin',
      'receivedDate': 'Mon, 04/15/2025',
      'returnedDate': 'Mon, 04/15/2025',
    },
    {
      'itemName': 'Sony A7 Mark II',
      'borrower': 'Mr. Salimin',
      'receivedDate': 'Mon, 04/15/2025',
      'returnedDate': 'Mon, 04/15/2025',
    },
    {
      'itemName': 'Sony A7 Mark II',
      'borrower': 'Mr. Salimin',
      'receivedDate': 'Mon, 04/15/2025',
      'returnedDate': 'Mon, 04/15/2025',
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
                'Sedang Aktif',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: loans.length,
                itemBuilder: (context, index) {
                  final loan = loans[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/foto.png',
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    loan['itemName'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    loan['borrower'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Terima',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            loan['receivedDate'] ?? '',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 12),
                                      const Icon(
                                        Icons.compare_arrows,
                                        size: 24,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Kembali',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            loan['returnedDate'] ?? '',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
