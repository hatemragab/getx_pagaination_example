class Movie {
  final String title;
  final String overview;
  final String? date;
  final String poster;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Movie({
    required this.title,
    required this.overview,
    required this.date,
    required this.poster,
  });

  Movie copyWith({
    String? title,
    String? overview,
    String? date,
    String? poster,
  }) {
    return Movie(
      title: title ?? this.title,
      overview: overview ?? this.overview,
      date: date ?? this.date,
      poster: poster ?? this.poster,
    );
  }

  @override
  String toString() {
    return 'Movie{title: $title, overview: $overview, date: $date, poster: $poster}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          overview == other.overview &&
          date == other.date &&
          poster == other.poster);

  @override
  int get hashCode =>
      title.hashCode ^ overview.hashCode ^ date.hashCode ^ poster.hashCode;

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? 'null',
      overview: map['overview'] ?? 'null',
      date: map['release_date'] ?? 'null',
      poster: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/' +
          map['poster_path'],
    );
  }



  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'overview': this.overview,
      'date': this.date,
      'poster': this.poster,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
