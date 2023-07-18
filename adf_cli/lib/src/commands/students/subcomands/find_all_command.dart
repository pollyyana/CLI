import 'dart:io';
import 'package:args/command_runner.dart';
import '../../../repositories/student_repository.dart';


// terminal : dart ./bin/adf_cli.dart students findAll 

class FindAllCommand extends Command {
  final StudentRepository repository;
  @override
  String get description => 'Find All Students';

  @override
  String get name => 'findAll';

  FindAllCommand(this.repository);

  @override
  Future<void> run () async {
    // print('rodando o find all');
    print('aguarde buscando alunos...');

    final students = await repository.findAll();
    print('Apresentar tambem os cursos? (S ou N)');

    final showCourses = stdin.readLineSync();
    print(showCourses);
    print('_________________________');
    print(' Aluno: ');
    print('_________________________');

    //where filtra e o map vai retornar apenas nome do curso e retorna .tolist para fzr a impressao
    for (var student in students) {
      if (showCourses?.toLowerCase() == 'sim') {
        print(
            '${student.id} - ${student.name} - ${student.courses.where((course) => course.isStudents).map((e) => e.name).toList()}');
      } else {
        print('${student.id} - ${student.name}');
      }

      
    }
  }
}
