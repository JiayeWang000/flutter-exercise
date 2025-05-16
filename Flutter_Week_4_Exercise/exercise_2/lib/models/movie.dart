class Movie {
  final String title;
  final String director;
  final String released;
  final String posterUrl;
  final String plot;

  Movie({
    required this.title,
    required this.director,
    required this.released,
    required this.posterUrl,
    required this.plot,
  });

  @override
  String toString() {
    return 'Movie(title: $title, director: $director, released: $released, posterUrl: $posterUrl, plot: $plot)';
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] as String,
      director: json['Director'] as String,
      released: json['Released'] as String,
      posterUrl: json['Poster'] as String,
      plot: json['Plot'] as String,
    );
  }
}