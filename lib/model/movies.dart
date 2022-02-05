class Movies {
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  Movies(
    this.id,
    this.popularity,
    this.title,
    this.poster,
    this.overview,
    this.rating,
    this.backPoster,
  );

  Movies.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster"],
        rating = json["rating"].toDouble(),
        overview = json["overview"]; 

   Map<String, dynamic> toJson() => {
      "id": id,
      "popularity": popularity,
      "poster": poster,
      "overview": overview,
      "rating": rating,
      "title": title,
  };

}
