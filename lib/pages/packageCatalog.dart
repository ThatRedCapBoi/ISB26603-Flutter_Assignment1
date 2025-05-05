import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/common/theme.dart';

import 'package:mobile_assignment_1/pages/packageDetail.dart';
import 'product.dart';

// import '/common/theme.dart';

class PackageCatalogPage extends StatelessWidget {
  const PackageCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Package Catalog')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of cards per row
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
          childAspectRatio: 0.8, // Adjust the aspect ratio of the cards
        ),
        itemCount: Package.samples.length,
        itemBuilder: (BuildContext context, int index) {
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
        },
      ),
    );
  }
}

Widget buildProductCard(BuildContext context, Package package) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage(package.imageUrl),
                fit: BoxFit.cover,
              ),
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
  return Container(
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      border: Border.all(color: color),
      color: backgroundColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}
