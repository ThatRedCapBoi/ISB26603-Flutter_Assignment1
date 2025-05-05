class Package {
  String name;
  String label;
  double price;
  String description;
  String imageUrl;
  // List<Detail> detail;

  Package(this.name, this.label, this.price, this.description, this.imageUrl);

  static List<Package> samples = [
    Package(
      'Package 1',
      'Special',
      9.90,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in felis a nisi viverra lobortis. Maecenas venenatis placerat tortor in mollis. Phasellus metus risus, accumsan eu cursus quis, efficitur sit amet ex. Vivamus condimentum velit in sem vestibulum pellentesque. Mauris faucibus ac elit ac imperdiet.",
      'assets/placeholder.png',
    ),
    Package(
      'Package 2',
      'Regular',
      5.50,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in felis a nisi viverra lobortis. Maecenas venenatis placerat tortor in mollis. Phasellus metus risus, accumsan eu cursus quis, efficitur sit amet ex. Vivamus condimentum velit in sem vestibulum pellentesque. Mauris faucibus ac elit ac imperdiet.",
      'assets/placeholder.png',
    ),
    Package(
      'Package 3',
      'Limited',
      20.90,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in felis a nisi viverra lobortis. Maecenas venenatis placerat tortor in mollis. Phasellus metus risus, accumsan eu cursus quis, efficitur sit amet ex. Vivamus condimentum velit in sem vestibulum pellentesque. Mauris faucibus ac elit ac imperdiet.",
      'assets/placeholder.png',
    ),
    Package(
      'Package 4',
      'Regular',
      12.90,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in felis a nisi viverra lobortis. Maecenas venenatis placerat tortor in mollis. Phasellus metus risus, accumsan eu cursus quis, efficitur sit amet ex. Vivamus condimentum velit in sem vestibulum pellentesque. Mauris faucibus ac elit ac imperdiet.",
      'assets/placeholder.png',
    ),
  ];
}
