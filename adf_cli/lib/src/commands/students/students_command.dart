import 'package:args/command_runner.dart';

import '../../repositories/student_repository.dart';
import 'subcomands/find_all_command.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students operation';

  @override
  String get name => 'students';

  final studentRepository = StudentRepository();
  //construtor para adc novos comandos
  StudentsCommand() {
    addSubcommand(FindAllCommand(studentRepository));
  }
}
