// import 'package:args/args.dart';
import 'package:adf_cli/src/commands/students/students_command.dart';
import 'package:args/command_runner.dart';

//terminal
//  dart ./bin/adf_cli.dart exemplo
// dart ./bin/adf_cli.dart exemplo -t console_full

void main(List<String> arguments) {
  CommandRunner('ADF CLI', 'ADF CLI')
    ..addCommand(StudentsCommand())
    ..run(arguments);
}












// void main(List<String> arguments) {
//   final argparse = ArgParser();
//   argparse.addFlag('data', abbr: 'd');
//   argparse.addOption('name', abbr: 'n');
//   argparse.addOption('template', abbr: 't');
//   final argResult = argparse.parse(arguments);

//   print('${argResult['data']}');
//   print('${argResult['name']}');
//   print('${argResult['template']}');

//   CommandRunner('ADF CLI', 'ADF CLI')
//     ..addCommand(ExemploCommand())
//     ..run(arguments);
// }

// class ExemploCommand extends Command {
//   @override
//   String get description => 'Exemplo de comando';

//   @override
//   String get name => 'exemplo';

//   ExemploCommand() {
//     argParser.addOption('template', abbr: 't');
//   }

//   @override
//   run() {
//     print(argResults?['template']);
//     print('executar qualquer coisa');
//   }
// }
