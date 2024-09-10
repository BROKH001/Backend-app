
class Person {

  late int? id;
  late String? name;
  late int? age;
  late String? gender;
  late String? image;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.image,
  });

  Map<String, dynamic> fromJson() {
    return {
      'id' : id,
      'name' : name,
      'age' : age,
      'gender' : gender,
      'image' : image,
    };
  }

  Person.toJson(Map<String, dynamic> res) 
    : id = res['id'],
      name = res['name'],
      age = res['age'],
      gender = res['gender'],
      image = res['image'];

}