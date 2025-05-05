import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/pages/about.dart';
import 'package:mobile_assignment_1/pages/packageCatalog.dart';
import 'package:mobile_assignment_1/pages/reservationDetail.dart';
import 'package:mobile_assignment_1/pages/orderPayment.dart';
import 'package:mobile_assignment_1/pages/reviewOrder.dart';

import 'package:mobile_assignment_1/common/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      // # App Bottom Navigation bar
      // appBar: AppBar(title: Text(widget.title)),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Expanded(child: Container()), // Placeholder for body content
      //   ],
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
      //   ],
      //   onTap: (index) {
      //     switch (index) {
      //       case 0:
      //         Navigator.pushNamed(context, '/OrderConfirmation');
      //         break;
      //       case 1:
      //         Navigator.pushNamed(context, '/packageOrder');
      //         break;
      //       case 2:
      //         Navigator.pushNamed(context, '/about');
      //         break;
      //     }
      //   },
      // ),
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
                      return reservationPage();
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
              child: Text("Order Details"),
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
    );
  }
}
