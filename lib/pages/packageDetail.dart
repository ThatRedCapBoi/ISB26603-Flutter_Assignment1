import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/main.dart';

import 'package:mobile_assignment_1/services/sqliteDatabase.dart';

import 'package:mobile_assignment_1/model/order.dart';

import 'package:mobile_assignment_1/model/product.dart';
import 'package:mobile_assignment_1/pages/packageCatalog.dart';

Icon icon(IconData icon) {
  return Icon(icon, color: Colors.black26);
}

class Packagedetail extends StatefulWidget {
  final Package package;
  const Packagedetail({super.key, required this.package});

  @override
  _PackagedetailState createState() {
    return _PackagedetailState();
  }
}

class _PackagedetailState extends State<Packagedetail> {
  final Sqlitedatabase _database = Sqlitedatabase.instance;

  String? _order = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.package.name} Detail"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(widget.package.imageUrl),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Product Name
                const SizedBox(height: 4),
                Text(
                  widget.package.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                // Price
                Text(
                  "RM ${widget.package.price.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                buildCardDetail(
                  icon: Icons.label,
                  color: Colors.blueAccent,
                  backgroundColor: Colors.blue[50],
                  text: widget.package.label,
                ),
                Divider(
                  color: Colors.blueGrey[100],
                  height: 20,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 4),
                Text(
                  "Details",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 8),
                Text(
                  widget.package.detail[0].items,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  widget.package.detail[0].description,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildAddToCartButton(context),
      ),
    );
  }

  Widget buildAddToCartButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          // Add to cart Order logic
          final orderToAdd = Order(
            id: 0, // Placeholder ID if the database auto-increments
            productName: widget.package.name,
            quantity: 1, // Default quantity
            productPrice: widget.package.price,
            imageUrl: widget.package.imageUrl,
          );

          try {
            // Add the order to the database
            _database.addOrder(orderToAdd);

            if (mounted) {
              // Show a success message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Added to Cart"),
                  duration: Duration(milliseconds: 1300),
                ),
              );

              // Navigate back to the catalog page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PackageCatalogPage(),
                ),
              );
            }
          } catch (e) {
            // Handle any errors
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Failed to add to cart: $e"),
                duration: const Duration(milliseconds: 1300),
              ),
            );
          }
        },
        child: const Text("Add to Cart"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
