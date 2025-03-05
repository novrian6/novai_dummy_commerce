import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';
import 'thank_you_screen.dart';

class PaymentScreen extends StatefulWidget {
  final List<Product> cartItems; // Ubah dari single product ke list of products

  const PaymentScreen({super.key, required this.cartItems});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = 'Credit/Debit Card';

  @override
  void initState() {
    super.initState();

    // Hitung total harga semua item
    double totalPrice = widget.cartItems.fold<double>(0, (sum, item) => sum + item.price);

    // Log event saat payment screen dibuka
    FirebaseAnalytics.instance.logEvent(
      name: 'payment_screen_opened',
      parameters: {
        'cart_size': widget.cartItems.length,
        'total_price': totalPrice,
      },
    );
  }

  // Format harga
  String _formatPrice(num price) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(price);
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.cartItems.fold<double>(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Products in Cart:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final product = widget.cartItems[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(_formatPrice(product.price)),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Total: ${_formatPrice(totalPrice)}', // Perbaikan total price
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
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Credit/Debit Card';
                });
              },
              selected: selectedPaymentMethod == 'Credit/Debit Card',
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('E-Wallet'),
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'E-Wallet';
                });
              },
              selected: selectedPaymentMethod == 'E-Wallet',
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Cash on Delivery'),
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Cash on Delivery';
                });
              },
              selected: selectedPaymentMethod == 'Cash on Delivery',
            ),

            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  String transactionId = 'T${DateTime.now().millisecondsSinceEpoch}';

                  // Log event pembelian
                  await FirebaseAnalytics.instance.logEvent(
                    name: 'purchase',
                    parameters: {
                      'transaction_id': transactionId,
                      'affiliation': 'MyStore',
                      'cart_size': widget.cartItems.length,
                      'total_price': totalPrice,
                      'currency': 'IDR',
                      'payment_type': selectedPaymentMethod,
                    },
                  );

                  // Navigasi ke Thank You screen
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