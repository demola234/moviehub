import 'package:moviehub/model/profile.dart';

class PersonResponse {
  final List<Person> person;
  final String error;

  PersonResponse(this.person, this.error);

  PersonResponse.fromJson(Map<String, dynamic> json)
      : person = (json["results"] as List)
            .map((i) => new Person.fromJson(i))
            .toList(),
        error = "";

  PersonResponse.withError(String errorVaule)
      : person = List.empty(),
        error = errorVaule;
}
