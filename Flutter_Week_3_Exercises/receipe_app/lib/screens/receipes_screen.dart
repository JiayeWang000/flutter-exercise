import "package:flutter/material.dart";
import "package:receipe_app/services/receipe_service.dart";
import "package:receipe_app/models/receipe.dart";
import "package:receipe_app/screens/ingredients_screen.dart";

class ReceipesScreen extends StatefulWidget {
  final String category;

  const ReceipesScreen({super.key, required this.category});

  @override
  State<ReceipesScreen> createState() => _ReceipesScreenState();
}

class _ReceipesScreenState extends State<ReceipesScreen> {
  late Future<List<Receipe>> _receipesFuture;

  @override
  void initState() {
    super.initState();
    _receipesFuture = ReceipeService().getReceipesOfCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: FutureBuilder<List<Receipe>>(
        future: _receipesFuture,
        builder: (context, snapshot) {
          final receipes = snapshot.data!;
          return Center(
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                itemCount: receipes.length,
                itemBuilder: (context, index) {
                  final receipe = receipes[index];
                  return SizedBox(
                    height: 80,
                    child: ListTile(
                      title: Text(receipe.name),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IngredientsScreen(receipe: receipe,),
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
