import 'package:flutter/material.dart';
import '../models/product.dart';
import 'thank_you_screen.dart';

class PaymentScreen extends StatelessWidget {
  final Product product;

  const PaymentScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product: ${product.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: Rp ${product.price.toString()}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Credit/Debit Card'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('E-Wallet'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Cash on Delivery'),
              onTap: () {},
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouScreen(),
                    ),
                  );
                },
                child: const Text('Complete Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}