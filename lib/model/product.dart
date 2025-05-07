class Package {
  String name;
  String label;
  MenuCategory category;
  double price;
  String imageUrl;
  List<Detail> detail;

  Package(
    this.name,
    this.label,
    this.category,
    this.price,
    this.imageUrl,
    this.detail,
  );

  static List<Package> samples = [
    Package(
      'Ultimate Chicken Combo',
      'Meal',
      MenuCategory.meal,
      18.50,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: 1x Big Taco, 1x Soft Drink 1x Nacho',
          'A hearty combo featuring a taco, nachos, and a refreshing drink — perfect for big appetites!',
        ),
      ],
    ),
    Package(
      'Taco Supreme Combo',
      'Meal',
      MenuCategory.meal,
      21.50,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: 2x Taco Supreme, 1x Soft Drink 1x Nacho',
          'Two hearty tacos stuffed with seasoned beef, beans, and fresh veggies — paired with nachos and Pepsi.',
        ),
      ],
    ),
    Package(
      'CHICKSTAR Combo',
      'Meal',
      MenuCategory.meal,
      20.90,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: 1x Big Chicken Wrap, 1x Soft Drink 1x Nacho',
          'Crispy chicken wrapped in a soft tortilla, topped with lettuce and sauce — served with nachos and Pepsi',
        ),
      ],
    ),
    Package(
      'Grilled Burrito Combo',
      'Meal',
      MenuCategory.meal,
      23.50,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: 1x Grilled Tortilla, 1x Soft Drink 1x Nacho',
          'A grilled tortilla stuffed with beans, meat, cheese, and veggies — comes with nachos and a Pepsi.',
        ),
      ],
    ),
    Package(
      'Crunchwrap Supreme',
      'Ala Carte',
      MenuCategory.alaCarte,
      12.78,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: Toasted Tortilla Wrap with Beef',
          'A hearty wrap packed with seasoned beef, crunchy tostada, fresh lettuce, tomatoes, cheese, and creamy sauce, all folded in a grilled tortilla for a satisfying bite.',
        ),
      ],
    ),
    Package(
      'KICKIN Chicken',
      'Ala Carte',
      MenuCategory.alaCarte,
      15.98,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: Spicy Chicken Soft Tacos',
          'Two soft tortillas filled with crispy, spicy chicken strips, shredded lettuce, cheese, and zesty sauce—perfect for spice lovers.',
        ),
      ],
    ),
    Package(
      'Chicken Quesadilla',
      'Ala Carte',
      MenuCategory.alaCarte,
      13.58,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: Grilled Cheesy Chicken Slices',
          'Grilled flour tortilla stuffed with seasoned chicken, melty cheese, and savory sauce, cut into wedges for easy sharing or solo munching.',
        ),
      ],
    ),

    Package(
      'BELL Bowl',
      'Ala Carte',
      MenuCategory.alaCarte,
      12.50,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: 1x Loaded Rice Bowl',
          'A colorful and filling bowl of Mexican-style rice, black beans, shredded cheese, salsa, fresh lettuce, crispy tortilla chips, and your choice of meat or vegetarian protein.',
        ),
      ],
    ),

    // SIDES
    Package(
      'Nacho Fries',
      'Sides',
      MenuCategory.sides,
      9.04,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: Crispy seasoned fries, 1x Cheese dip',
          'Golden, crispy fries coated with zesty seasoning and served with a side of creamy nacho cheese sauce.',
        ),
      ],
    ),

    Package(
      'Cheesy Nachos',
      'Sides',
      MenuCategory.sides,
      7.84,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: Tortilla chips, 1x Cheese dip',
          'Crisp tortilla chips paired with warm, velvety cheese sauce — the ultimate cheesy sidekick.',
        ),
      ],
    ),

    Package(
      'Cinamon TWIEST',
      'Sides',
      MenuCategory.sides,
      4.90,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: Sweet cinnamon twists',
          'Light and crunchy twists dusted with cinnamon sugar — a sweet treat to finish your meal.',
        ),
      ],
    ),

    Package(
      'CHOCODILLA',
      'Sides',
      MenuCategory.sides,
      6.90,
      'assets/placeholder.png',
      [
        Detail(
          'In the Set: Grilled chocolate quesadilla',
          'A warm grilled tortilla stuffed with rich melted chocolate — a dessert twist with a satisfying crunch.',
        ),
      ],
    ),
  ];
}

class Detail {
  String items;
  String description;

  Detail(this.items, this.description);
}

enum MenuCategory { meal, alaCarte, sides }

String categoryToString(MenuCategory category) {
  switch (category) {
    case MenuCategory.meal:
      return 'Meal';
    case MenuCategory.alaCarte:
      return 'Ala Carte';
    case MenuCategory.sides:
      return 'Sides';
  }
}
