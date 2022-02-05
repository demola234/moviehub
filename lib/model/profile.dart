class Person {
  int id;
  String name;
  double popularity;
  String profileImg;
  String known;

  Person(this.id, this.name, this.popularity, this.known, this.profileImg);


  Person.fromJson(Map<String, dynamic> json)
       : id = json["id"],
        name = json["name"],
        popularity = json["popularity"].toDouble(),
        profileImg = json["profile_path"],
        known = json["known"];
}
