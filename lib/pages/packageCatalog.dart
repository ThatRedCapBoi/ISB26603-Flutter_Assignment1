import 'package:flutter/material.dart';
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
            child: buildProductCard(Package.samples[index]),
          );
        },
      ),
    );
  }
}

Widget buildProductCard(Package package) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(image: AssetImage(package.imageUrl)),
          ),
          const SizedBox(height: 8.0),
          Text(
            package.name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Text(
            package.label,
            style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
          ),
          const SizedBox(height: 4.0),
        ],
      ),
    ),
  );
}
