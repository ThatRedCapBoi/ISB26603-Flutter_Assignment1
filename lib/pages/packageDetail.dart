import 'package:flutter/material.dart';
import 'product.dart';

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
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                // Full Name
                const SizedBox(height: 4),
                Text(
                  widget.package.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildCardDetail(
                  icon: Icons.label,
                  color: Colors.blueAccent,
                  backgroundColor: Colors.blue[50],
                  text: widget.package.label,
                ),
                buildCardDetail(
                  icon: Icons.monetization_on,
                  color: Colors.green,
                  backgroundColor: Colors.green[50],
                  text: "RM${widget.package.price.toStringAsFixed(2)}",
                ),
                Divider(
                  color: Colors.blueGrey[100],
                  height: 20,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 4),
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
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
}
