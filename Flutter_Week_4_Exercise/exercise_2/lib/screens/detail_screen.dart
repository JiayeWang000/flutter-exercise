import 'package:exercise_2/models/movie.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  String replaceWithHTTPS(String url) {
  return url.replaceFirst(RegExp(r'^http'), 'https');
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              replaceWithHTTPS(movie.posterUrl),
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
              errorBuilder: (context, error, stackTrace) => const Center(
                child: SizedBox(
                  height: 500,
                  child: Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                ),
                )
              ),
              height: 500,
            ),
            const SizedBox(height: 16.0),
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('Director: ${movie.director}'),
            const SizedBox(height: 8.0),
            Text('Release Year: ${movie.released}'),
            const SizedBox(height: 16.0),
            Text(movie.plot),
          ],
        ),
      ),
    );
  }
}