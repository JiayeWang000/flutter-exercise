import "package:flutter/material.dart";
import "package:receipe_app/services/receipe_service.dart";
import "package:receipe_app/models/receipe.dart";
import 'package:receipe_app/screens/categories_screen.dart';

class IngredientsScreen extends StatelessWidget {
  final Receipe receipe;
  const IngredientsScreen({super.key, required this.receipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receipe.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Ingredients: ${receipe.ingredients.join(', ')}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecipeScreen()),
              );
            },
            child: const Text('Back to Categories'),
          ),
        ],
      ),
    );
  }
}
