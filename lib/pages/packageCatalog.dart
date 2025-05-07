import 'package:flutter/material.dart';

import 'package:mobile_assignment_1/main.dart';
import 'package:mobile_assignment_1/pages/packageDetail.dart';
import 'package:mobile_assignment_1/model/product.dart';

import 'meal-Product_Catalog.dart';
import 'alaCarte-Product_Catalog.dart';
import 'sideMeal-Product_Catalog.dart';

class PackageCatalogPage extends StatelessWidget {
  const PackageCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Product Catalog')),
      body: Column(
        children: [
          Container(
            width: screenSize.width * 1,
            height: screenSize.width * 0.2,
            padding: const EdgeInsets.all(8.0),
            color: Colors.deepOrange[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCategoryButton(
                  title: 'Meal',
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MealPage()),
                    );
                  },
                ),
                buildCategoryButton(
                  title: 'Ala Carte',
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlaCartePage(),
                      ),
                    );
                  },
                ),
                buildCategoryButton(
                  title: 'Sides',
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SidesPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Number of cards per row
              crossAxisSpacing: 8.0, // Spacing between columns
              mainAxisSpacing: 8.0, // Spacing between rows
              childAspectRatio: 0.65, // Adjust the aspect ratio of the cards
              children: List.generate(Package.samples.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Packagedetail(package: Package.samples[index]);
                        },
                      ),
                    );
                  },
                  child: buildProductCard(context, Package.samples[index]),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }
}

Widget buildProductCard(BuildContext context, Package package) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(package.imageUrl, fit: BoxFit.fitWidth),
            ),
          ),

          const SizedBox(height: 8.0),
          Text(
            package.name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4.0),
          Text(
            "RM${package.price.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 8.0),
          buildCardDetail(
            icon: Icons.label,
            color: Colors.blueAccent,
            backgroundColor: Colors.blue[50],
            text: package.label,
          ),
        ],
      ),
    ),
  );
}

Widget buildCardDetail({
  required IconData icon,
  required Color color,
  required Color? backgroundColor,
  required String text,
}) {
  Color determineColor(String category) {
    switch (category) {
      case 'Meal':
        return Colors.greenAccent;
      case 'Ala Carte':
        return Colors.orangeAccent;
      case 'Sides':
        return Colors.purpleAccent;
      default:
        return Colors.blueAccent;
    }
  }

  Color determineBackgroundColor(String category) {
    switch (category) {
      case 'Meal':
        return Colors.green[50]!;
      case 'Ala Carte':
        return Colors.orange[50]!;
      case 'Sides':
        return Colors.purple[50]!;
      default:
        return Colors.blue[50]!;
    }
  }

  return Container(
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      border: Border.all(color: determineColor(text)),
      color: determineBackgroundColor(text),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: determineColor(text)),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}

Widget buildCategoryButton({
  required String title,
  required Color color,
  required VoidCallback onTap,
}) {
  return SizedBox(
    width: 120,
    height: 40,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
