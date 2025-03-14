class Food {
  Food({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.kcal,
    required this.cookingTime,
    required this.description,
    required this.shop, // Add shop field
  });

  String id;
  String image;
  String name;
  int price;
  double rate;
  String kcal;
  String cookingTime;
  String description;
  String shop; // Shop field

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        rate: json["rate"].toDouble(),
        kcal: json["kcal"],
        cookingTime: json["cooking_time"],
        description: json["description"],
        shop: json["shop"], // Initialize shop
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "rate": rate,
        "kcal": kcal, // Corrected typo
        "cooking_time": cookingTime,
        "description": description,
        "shop": shop, // Include shop in JSON representation
      };
}

final dummyFoods = [
  Food(
    id: '1',
    image: 'assets/images/apples.png',
    name: 'Apple',
    price: 15,
    rate: 4.5,
    kcal: '100',
    cookingTime: '20 Min',
    description: '...',
    shop: 'Shop A', // Specify shop for the first instance of Apple
  ),
  Food(
    id: '2',
    image: 'assets/images/apples.png',
    name: 'Apple',
    price: 17,
    rate: 4.7,
    kcal: '100',
    cookingTime: '20 Min',
    description: '...',
    shop: 'Shop B', // Specify shop for the second instance of Apple
  ),
  // Add more instances for different shops or supermarkets if needed
];
