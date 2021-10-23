import 'package:harry_potter_api/models/wand.dart';

class Character {
  String name = '';
  List<String> alternateNames = [];
  String species = '';
  String gender = '';
  String house = '';
  String dateOfBirth = '';
  String yearOfBirth = '';
  bool wizard = false;
  String ancestry = '';
  String eyeColour = '';
  String hairColour = '';
  Wand wand = Wand(wood: '', core: '', length: '');
  String patronus = '';
  bool hogwartsStudent = false;
  bool hogwartsStaff = false;
  String actor = '';
  List<String> alternateActors = [];
  bool alive = false;
  String image = '';

  Character(
      {required this.name,
      required this.alternateNames,
      required this.species,
      required this.gender,
      required this.house,
      required this.dateOfBirth,
      required this.yearOfBirth,
      required this.wizard,
      required this.ancestry,
      required this.eyeColour,
      required this.hairColour,
      required this.wand,
      required this.patronus,
      required this.hogwartsStudent,
      required this.hogwartsStaff,
      required this.actor,
      required this.alternateActors,
      required this.alive,
      required this.image});

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['alternate_names'] != null) {
      if (json['alternate_names'] is String) {
        alternateNames.add(json['alternate_names']);
      } else {
        json['alternate_names'].forEach((v) {
          alternateNames.add(v);
        });
      }
    }
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    yearOfBirth = json['yearOfBirth'].toString();
    wizard = json['wizard'];
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    wand = Wand.fromJson(json['wand']);
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    alternateActors = json['alternate_actors'].cast<String>();
    alive = json['alive'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alternate_names'] = this.alternateNames;
    data['species'] = this.species;
    data['gender'] = this.gender;
    data['house'] = this.house;
    data['dateOfBirth'] = this.dateOfBirth;
    data['yearOfBirth'] = this.yearOfBirth;
    data['wizard'] = this.wizard;
    data['ancestry'] = this.ancestry;
    data['eyeColour'] = this.eyeColour;
    data['hairColour'] = this.hairColour;
    data['wand'] = this.wand.toJson();
    data['patronus'] = this.patronus;
    data['hogwartsStudent'] = this.hogwartsStudent;
    data['hogwartsStaff'] = this.hogwartsStaff;
    data['actor'] = this.actor;
    data['alternate_actors'] = this.alternateActors;
    data['alive'] = this.alive;
    data['image'] = this.image;
    return data;
  }
}
