import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/pages/reviewOrder.dart';

class OrderPaymentPage extends StatelessWidget {
  const OrderPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Ultimate Chicken Combo'),
                    trailing: const Text('\RM18.50'),
                  ),
                  ListTile(
                    title: const Text('Crunchwrap Supreme'),
                    trailing: const Text('\RM12.78'),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Total Discount '),
                    trailing: const Text('\RM1.28'),
                  ),

                  ListTile(
                    title: const Text('Total Payment'),
                    trailing: const Text(
                      '\RM30.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const ReviewPage(
                          orderedItems: [
                            'Ultimate Chicken Combo',
                            'Crunchwrap Supreme',
                          ],
                        ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
