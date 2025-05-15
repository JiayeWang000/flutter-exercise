import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:receipe_app/models/receipe.dart';

class ReceipeService {
  final String josnPath = 'assets/data/mobile-apps-portfolio-03-recipes.json';

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<List<Receipe>> getReceipes() async {
    Map<String, dynamic> data = await loadJsonFromAssets(josnPath);
    List<Receipe> receipes = (data['recipes'] as List)
        .map((recipe) => Receipe.fromJson(recipe))
        .toList();
    return receipes;
  }

  Set<String> getCategories(List<Receipe> receipes) {
    return receipes.map((recipe) => recipe.category).toSet();
  }

  Future<List<Receipe>> getReceipesOfCategory(String category) async{
    List<Receipe> receipes = await getReceipes();
    return receipes.where((recipe) => recipe.category == category).toList();
  }
}
