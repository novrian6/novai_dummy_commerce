import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';
import 'payment_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    // Log event saat layar cart dibuka
    FirebaseAnalytics.instance.logEvent(
      name: 'cart_screen_opened',
      parameters: {
        'cart_size': widget.cartItems.length,
        'total_price': widget.cartItems.fold<double>(0, (sum, item) => sum + item.price),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    double totalPrice = widget.cartItems.fold<double>(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: widget.cartItems.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final product = widget.cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: Text(product.name),
                      subtitle: Text(formatCurrency.format(product.price)), // Price formatted
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            widget.cartItems.removeAt(index);
                          });

                          // Log event saat item dihapus dari cart
                          FirebaseAnalytics.instance.logEvent(
                            name: 'cart_item_removed',
                            parameters: {
                              'item_id': product.id,
                              'item_name': product.name,
                              'price': product.price,
                              'remaining_items': widget.cartItems.length,
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Total: ${formatCurrency.format(totalPrice)}', // Total formatted
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.cartItems.isEmpty
                    ? null
                    : () {
                  // Log event saat tombol Proceed to Checkout ditekan
                  FirebaseAnalytics.instance.logEvent(
                    name: 'proceed_to_checkout_pressed',
                    parameters: {
                      'cart_size': widget.cartItems.length,
                      'total_price': totalPrice,
                    },
                  );

                  // Navigasi ke PaymentScreen dengan semua cart items
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(cartItems: widget.cartItems),
                    ),
                  );
                },
                child: const Text('Proceed to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}