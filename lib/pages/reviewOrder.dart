import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final List<String> orderedItems; // List of ordered items to review

  const ReviewPage({super.key, required this.orderedItems});

  @override
  ReviewPageState createState() => ReviewPageState();
}

class ReviewPageState extends State<ReviewPage> {
  // Map to hold reviews for each item
  final Map<String, Map<String, dynamic>> _reviews = {};

  @override
  void initState() {
    super.initState();
    // Initialize reviews with default values (rating = 0.0, empty review text)
    for (var item in widget.orderedItems) {
      _reviews[item] = {"rating": 0.0, "review": ""};
    }
  }

  void _submitAllReviews() {
    // Check if all items have been rated and reviewed
    bool hasEmpty = _reviews.values.any(
      (review) =>
          review["rating"] == 0.0 || (review["review"] as String).isEmpty,
    );

    if (hasEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please rate and review all items.")),
      );
      return;
    }

    // If all reviews are complete, print the reviews (for now, you can replace it with a logger)
    debugPrint("Submitted Reviews: $_reviews");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Thank you for your reviews!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Review Your Order")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ...widget.orderedItems.map((item) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // ⭐ Star rating row ⭐
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: Icon(
                              index < _reviews[item]!["rating"]
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                            ),
                            onPressed: () {
                              setState(() {
                                _reviews[item]!["rating"] = index + 1.0;
                              });
                            },
                          );
                        }),
                      ),

                      // Review text input
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your review',
                        ),
                        onChanged: (value) {
                          _reviews[item]!["review"] = value;
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _submitAllReviews,
              child: const Text('Submit All Reviews'),
            ),
          ],
        ),
      ),
    );
  }
}
