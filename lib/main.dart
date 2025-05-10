import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/common/theme.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:mobile_assignment_1/pages/about.dart';
import 'package:mobile_assignment_1/pages/packageCatalog.dart';
import 'package:mobile_assignment_1/pages/reservationDetail.dart';
import 'package:mobile_assignment_1/pages/orderPayment.dart';
import 'package:mobile_assignment_1/pages/reviewOrder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // // Functions
  // Future<void> saveData(String orderDetails) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   // await prefs.setString('reservationDetails', reservationDetails);
  //   await prefs.setString('orderDetails', orderDetails);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const MyHomePage(title: 'Flutter - Demo Homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Main Page - Package Menu Demo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutPage();
                    },
                  ),
                );
              },
              child: Text("About"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ReservationPage();
                    },
                  ),
                );
              },
              child: Text("Reservation"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PackageCatalogPage();
                    },
                  ),
                );
              },
              child: Text("Product Catalog"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderPaymentPage();
                    },
                  ),
                );
              },
              child: Text("Order Payment"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ReviewPage(
                        orderedItems: ["Package 1", "Package 2"],
                      );
                    },
                  ),
                );
              },
              child: Text("Order Review"),
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }
}

Widget buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderPaymentPage()),
      );
    },
    backgroundColor: Theme.of(context).colorScheme.primary,
    child: const Icon(Icons.shopping_cart_rounded, color: Colors.white),
  );
}
