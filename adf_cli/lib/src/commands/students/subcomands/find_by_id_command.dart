import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

/*
Exemplo terminal
dart ./bin/adf_cli.dart students byId -i 0
*/ 

class FindByIdCommand extends Command {
  final StudentRepository studentRepository;

  @override
  String get description => 'Find Student By Id';

  @override
  String get name => 'byId';

  // contrutor
  FindByIdCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    // print(argResults?['id']);

    if (argResults?['id'] == null) {
      print('Por favor envie o id  do aluno com o comando  --id=0 ou -i 0');
      return;
    }
    final id = int.parse(argResults?['id'] ?? '');

    print('aguarde buscando dados...');

    final student = await studentRepository.findById(id);

    print('------------------------------------------------------');
    print('Aluno: ${student.name}:');
    print('------------------------------------------------------');
    print('Nome: ${student.name}');
    print('Idade: ${student.age ?? 'Nao informado'}');
    print('Curso: ');
    student.nameCourses.forEach(print);
    print('Endereço: ');
    print(' ${student.address.street} (${student.address.zipCode})');
  }
}
