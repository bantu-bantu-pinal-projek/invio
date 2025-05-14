class InventoryItem {
  final String id;
  final String name;
  final String code;
  final int quantity;
  final bool available;
  final String category;
  final String imagePath;

  InventoryItem({
    required this.id,
    required this.name,
    required this.code,
    required this.quantity,
    required this.available,
    required this.category,
    this.imagePath = 'assets/images/foto.png',
  });

  // For search functionality
  bool matchesQuery(String query) {
    final lowercaseQuery = query.toLowerCase();
    return name.toLowerCase().contains(lowercaseQuery) ||
        code.toLowerCase().contains(lowercaseQuery) ||
        category.toLowerCase().contains(lowercaseQuery);
  }
}

// Mock data for testing
List<InventoryItem> getMockInventoryItems() {
  return [
    InventoryItem(
      id: '1',
      name: 'Sony A7 Mark II',
      code: 'BRG001',
      quantity: 5,
      available: true,
      category: 'Multimedia',
    ),
    InventoryItem(
      id: '2',
      name: 'Laptop HP Pavilion',
      code: 'BRG002',
      quantity: 10,
      available: true,
      category: 'Office',
    ),
    InventoryItem(
      id: '3',
      name: 'Proyektor Epson',
      code: 'BRG003',
      quantity: 3,
      available: false,
      category: 'Multimedia',
    ),
    InventoryItem(
      id: '4',
      name: 'Kursi Kantor',
      code: 'BRG004',
      quantity: 20,
      available: true,
      category: 'Office',
    ),
    InventoryItem(
      id: '5',
      name: 'Sound System JBL',
      code: 'BRG005',
      quantity: 2,
      available: true,
      category: 'Accommodation',
    ),
    InventoryItem(
      id: '6',
      name: 'Mesin Fotokopi',
      code: 'BRG006',
      quantity: 1,
      available: true,
      category: 'Office',
    ),
    InventoryItem(
      id: '7',
      name: 'Mobil Operasional',
      code: 'BRG007',
      quantity: 3,
      available: true,
      category: 'Transportation',
    ),
    InventoryItem(
      id: '8',
      name: 'Alat Perbaikan Kit',
      code: 'BRG008',
      quantity: 5,
      available: true,
      category: 'Tecnik',
    ),
  ];
}
