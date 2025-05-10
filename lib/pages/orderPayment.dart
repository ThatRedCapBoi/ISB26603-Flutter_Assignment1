import 'package:flutter/material.dart';

import 'package:mobile_assignment_1/services/sqliteDatabase.dart';
import 'package:mobile_assignment_1/model/order.dart';

import 'package:mobile_assignment_1/pages/reviewOrder.dart';

class OrderPaymentPage extends StatefulWidget {
  const OrderPaymentPage({super.key});

  @override
  State<OrderPaymentPage> createState() => _OrderPaymentPageState();
}

class _OrderPaymentPageState extends State<OrderPaymentPage> {
  final Sqlitedatabase _database = Sqlitedatabase.instance;

  Future<void> _deleteOrder(int orderId) async {
    try {
      _database.deleteOrder(
        orderId,
      ); // Call delete function from sqliteDatabase.dart
      setState(() {}); // Refresh the UI after deletion
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to delete order: $e')));
    }
  }

  Future<void> _increaseOrder(Order order) async {
    // Example: Update the quantity of the order
    final updatedOrder = Order(
      id: order.id,
      productName: order.productName,
      quantity: order.quantity + 1, // Increment quantity as an example
      productPrice: order.productPrice,
      imageUrl: order.imageUrl,
    );

    try {
      _database.updateOrder(
        updatedOrder,
      ); // Call update function from sqliteDatabase.dart
      setState(() {}); // Refresh the UI after update
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Order increment successfully')),
      // );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to increment order: $e')));
    }
  }

  Future<void> _decreaseOrder(Order order) async {
    // Example: Update the quantity of the order
    final updatedOrder = Order(
      id: order.id,
      productName: order.productName,
      quantity: order.quantity - 1, // Increment quantity as an example
      productPrice: order.productPrice,
      imageUrl: order.imageUrl,
    );

    try {
      _database.updateOrder(
        updatedOrder,
      ); // Call update function from sqliteDatabase.dart
      setState(() {}); // Refresh the UI after update
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Order decrement successfully')),
      // );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to decrement order: $e')));
    }
  }

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
              child: FutureBuilder<List<Order>>(
                future: _database.getOrders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading orders'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No orders found'));
                  }

                  final orders = snapshot.data!;
                  double totalAmount = 0;
                  int totalQuantity = 0;

                  for (var order in orders) {
                    totalAmount += order.productPrice * order.quantity;
                    totalQuantity += order.quantity;
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    order.imageUrl,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(order.productName),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // const SizedBox(width: 8),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            _decreaseOrder(order);
                                          },
                                        ),
                                        Text(
                                          '${order.quantity}',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            _increaseOrder(order);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'RM${(order.productPrice * order.quantity).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete_sharp,
                                        color: Color.fromARGB(255, 145, 11, 2),
                                      ),
                                      onPressed: () {
                                        _deleteOrder(order.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Quantity: $totalQuantity',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Total Amount: \RM${totalAmount.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final orders = await _database.getOrders();
                final orderedItems =
                    orders
                        .map(
                          (order) =>
                              '${order.productName} (x${order.quantity})',
                        )
                        .toList();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ReviewPage(orderedItems: orderedItems),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size(double.infinity, 50),
              ).copyWith(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                ) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.grey[900]!; // Dark gray on hover
                  }
                  return Theme.of(
                    context,
                  ).colorScheme.tertiary; // Default color
                }),
              ),
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
