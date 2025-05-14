import 'package:flutter/material.dart';
import '../../komponen/navbar/navbar_bottom.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  // Example data for demonstration
  final List<Map<String, dynamic>> loanHistory = const [
    {
      'itemName': 'Sony A7 Mark II',
      'borrower': 'ucrup',
      'receivedDate': 'Sen,13/04/2023',
      'returnedDate': 'Sen,15/04/2023',
      'isReturned': true,
      'quantity': 1,
    },
    {
      'itemName': 'Sony A7 Mark II',
      'borrower': 'Mr. Salimin',
      'receivedDate': 'Sen,13/04/2023',
      'returnedDate': 'Sen,15/04/2023',
      'isReturned': false,
      'quantity': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Riwayat Pinjaman',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: loanHistory.length,
        itemBuilder: (context, index) {
          final loan = loanHistory[index];
          return _buildLoanHistoryCard(
            itemName: loan['itemName'],
            borrower: loan['borrower'],
            receivedDate: loan['receivedDate'],
            returnedDate: loan['returnedDate'],
            isReturned: loan['isReturned'],
            quantity: loan['quantity'],
          );
        },
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }

  Widget _buildLoanHistoryCard({
    required String itemName,
    required String borrower,
    required String receivedDate,
    required String returnedDate,
    required bool isReturned,
    required int quantity,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/foto.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),

                // Item Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Item name
                          Text(
                            itemName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Status badge
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isReturned
                                          ? const Color(0xFFE6F5E6)
                                          : const Color(0xFFFFCDD2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  isReturned ? 'Dikembalikan' : 'Terlambat',
                                  style: TextStyle(
                                    color:
                                        isReturned
                                            ? const Color(0xFF1B5E20)
                                            : const Color(0xFFB71C1C),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Jumlah: $quantity',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Borrower
                      Text(
                        borrower,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Loan status dates
                      Row(
                        children: [
                          // Received date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  receivedDate,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Arrow
                          const Icon(Icons.swap_horiz, color: Colors.grey),

                          // Return date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  returnedDate,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
