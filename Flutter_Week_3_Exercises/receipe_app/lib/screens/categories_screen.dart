import "package:flutter/material.dart";
import "package:receipe_app/services/receipe_service.dart";
import "package:receipe_app/models/receipe.dart";
import "package:receipe_app/screens/receipes_screen.dart";

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late Future<List<Receipe>> _receipesFuture;
  late Set<String> _categories;

  @override
  void initState() {
    super.initState();
    _receipesFuture = ReceipeService().getReceipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: FutureBuilder<List<Receipe>>(
        future: _receipesFuture,
        builder: (context, snapshot) {
          final receipes = snapshot.data!;
          final categories = ReceipeService().getCategories(receipes).toList();
          return Center(
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return SizedBox(
                    height: 80,
                    child: ListTile(
                      title: Text(category),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ReceipesScreen(category: category),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
