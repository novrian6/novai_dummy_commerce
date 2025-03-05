import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //firebase analytics
    FirebaseAnalytics.instance.logScreenView(screenName: 'ThankYouScreen');
    // Log the "purchase_success" event when the screen is displayed
    FirebaseAnalytics.instance.logEvent(
      name: 'thank_you_screen_opened',
      parameters: {
        'screen': 'ThankYouScreen',
        'message': 'User completed a purchase successfully',
      },
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: const Text('Thank You!'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 20),
              const Text(
                'Payment Successful!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Thank you for your purchase. Your order is being processed.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                          (route) => false, // Clears the navigation stack
                    );
                  },
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}