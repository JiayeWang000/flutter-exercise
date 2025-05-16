import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:exercise_2/screens/detail_screen.dart';
import 'package:exercise_2/models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final List<dynamic> jsonData = await loadJsonFromAssets(
      'assets/data/movie_data.json',
    );
    setState(() {
      _movies = jsonData
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();
    });
  }

  Future<List<dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return ListTile(
            title: Text(movie.title),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(movie: movie)),
              )
            },
          );
        },
      )
    );
  }
}