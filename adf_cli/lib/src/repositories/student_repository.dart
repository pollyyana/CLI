import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/student.dart';

class StudentRepository {
  //Buscar todos sem parametro
  Future<List<Student>> findAll() async {
    final studentsResult =
        await http.get(Uri.parse('http://localhost:8080/students'));

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }

    // json decode pq 'e um array
    //as List para auto complete
    final studentsData = jsonDecode(studentsResult.body);

    return studentsData.map<Student>((student) {
      return Student.fromMap(student);
    }).toList();
  }

  //um studante especifico buscar pelo id
  Future<Student> findById(int id) async {
    final studentResult =
        await http.get(Uri.parse('http://localhost:8080/students/$id'));

    if (studentResult.statusCode != 200) {
      throw Exception();
    }
    if (studentResult.body == '{}') {
      throw Exception();
    }
    //se ta tudo certo pode pegar o student frmJson
    return Student.fromJson(studentResult.body);
  }
  //insert(post)
  // para inserir uma novo aluno, adc um novo student
  Future<void> insert(Student student) async {
    final response =
        await http.post(Uri.parse('http://localhost:8080/students'),
            //serializar
            body: student.toJson(),
            headers: {
          'content-type': 'aplication/json',
        });

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
  //update(put)
  // para atualizar novs dados de um estudante
  Future<void> update(Student student) async {
    final response = await http.post(
        Uri.parse('http://localhost:8080/students/${student.id}'),
        body: student.toJson(),
        headers: {'content-type ': 'aplication/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  //vai deletar o usuario pelo id
  Future<void> deleteById(int id) async {
    final response =
        await http.delete(Uri.parse('http://localhost:8080/students/$id'));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
