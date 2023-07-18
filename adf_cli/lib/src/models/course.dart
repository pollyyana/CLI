// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Course{
  int id;
  String name;
  bool isStudents;
  Course({
    required this.id,
    required this.name,
    required this.isStudents,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isStudents': isStudents,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] ?? 0,
      name: map['name']?? '',
      isStudents: map['isStudents']?? false,
    );
  }

  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));
}
