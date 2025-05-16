import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListTile Demo'),
        ),
        body:ListTileDemo(),
      ),
    );
  }
}

class ListTileDemo extends StatefulWidget {
  const ListTileDemo({super.key});

  @override
  State<ListTileDemo> createState() => _ListTileDemoState();
}

class _ListTileDemoState extends State<ListTileDemo> {
  List<dynamic> _movies = [];

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
      _movies = jsonData;
    });
  }

  Future<List<dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return ListTile(
            title: Text(movie['Title']),
          );
        },
      );
  }
}