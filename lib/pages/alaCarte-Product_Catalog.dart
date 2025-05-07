import 'package:flutter/material.dart';

import 'package:mobile_assignment_1/main.dart';
import 'packageDetail.dart';
import 'package:mobile_assignment_1/model/product.dart';

class AlaCartePage extends StatelessWidget {
  const AlaCartePage({super.key});

  @override
  Widget build(BuildContext context) {
    final alacartePackages =
        Package.samples
            .where((package) => package.category == MenuCategory.alaCarte)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ala Carte Menu'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.65,
        ),
        itemCount:
            alacartePackages
                .length, // Display only filtered "Ala Carte" packages
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          Packagedetail(package: alacartePackages[index]),
                ),
              );
            },
            child: buildProductCard(
              context,
              alacartePackages[index],
            ), // Pass filtered "Sides" package
          );
        },
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
