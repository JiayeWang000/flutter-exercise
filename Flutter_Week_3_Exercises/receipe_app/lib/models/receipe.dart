class Receipe {
  final String name;
  final String category;
  final List<String> ingredients;


  Receipe({
    required this.name,
    required this.category,
    required this.ingredients,
  });

  factory Receipe.fromJson(Map<String, dynamic> json) {
    return Receipe(
      name: json['name'] as String,
      category: json['category'] as String,
      ingredients: List<String>.from(json['ingredients']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'ingredients': ingredients,
    };
  }
}