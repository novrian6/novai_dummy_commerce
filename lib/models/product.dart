class Product {
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  // Updated product list with Lorem Picsum image URLs
  static List<Product> getDummyProducts() {
    return [
      Product(
        id: '1',
        name: 'Sony WH-1000XM4 Wireless Headphones',
        price: 4500000,
        imageUrl: 'https://picsum.photos/seed/sony_wh1000xm4/600/400',
        description: 'Industry-leading noise-canceling wireless headphones with exceptional sound quality.',
      ),
      Product(
        id: '2',
        name: 'Samsung Galaxy S24 Ultra 5G',
        price: 21999000,
        imageUrl: 'https://picsum.photos/seed/galaxy_s24_ultra/600/400',
        description: 'Flagship smartphone with a 200MP camera and Snapdragon 8 Gen 3 processor.',
      ),
      Product(
        id: '3',
        name: 'Apple MacBook Pro M2',
        price: 27000000,
        imageUrl: 'https://picsum.photos/seed/macbook_pro_m2/600/400',
        description: 'Powerful MacBook Pro with M2 chip, Retina display, and long battery life.',
      ),
      Product(
        id: '4',
        name: 'Apple Watch Series 9',
        price: 7500000,
        imageUrl: 'https://picsum.photos/seed/apple_watch_series_9/600/400',
        description: 'Advanced smartwatch with ECG, fitness tracking, and always-on Retina display.',
      ),
      Product(
        id: '5',
        name: 'JBL Charge 5 Bluetooth Speaker',
        price: 2200000,
        imageUrl: 'https://picsum.photos/seed/jbl_charge_5/600/400',
        description: 'Portable waterproof Bluetooth speaker with deep bass and 20 hours of playtime.',
      ),
      Product(
        id: '6',
        name: 'Logitech G Pro Wireless Gaming Mouse',
        price: 1800000,
        imageUrl: 'https://picsum.photos/seed/logitech_g_pro/600/400',
        description: 'Ultra-lightweight gaming mouse with HERO 25K sensor and customizable buttons.',
      ),
      Product(
        id: '7',
        name: 'Razer BlackWidow V4 Mechanical Keyboard',
        price: 2500000,
        imageUrl: 'https://picsum.photos/seed/razer_blackwidow_v4/600/400',
        description: 'RGB mechanical keyboard with green switches for ultimate gaming performance.',
      ),
      Product(
        id: '8',
        name: 'Sony WF-1000XM4 Wireless Earbuds',
        price: 3800000,
        imageUrl: 'https://picsum.photos/seed/sony_wf1000xm4/600/400',
        description: 'Premium noise-canceling true wireless earbuds with crystal-clear sound quality.',
      ),
      Product(
        id: '9',
        name: 'WD My Passport 2TB External Hard Drive',
        price: 1400000,
        imageUrl: 'https://picsum.photos/seed/wd_my_passport_2tb/600/400',
        description: 'Portable 2TB external hard drive for backups and extra storage.',
      ),
      Product(
        id: '10',
        name: 'LG 27UP850 4K Monitor',
        price: 7500000,
        imageUrl: 'https://picsum.photos/seed/lg_27up850/600/400',
        description: '4K UHD monitor with HDR, USB-C connectivity, and ultra-wide color accuracy.',
      ),
    ];
  }
}