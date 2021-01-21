import 'package:console_full/constants/app_constants.dart';
import 'package:console_full/constants/commands.dart';

class ExeProcess {
  String commandMode;
  String command;
  var arguments;
  ExeProcess({this.commandMode, this.command, this.arguments});

  static List<ExeProcess> getProcesses() {
    return [
      // ExeProcess(commandMode: cleanMode, command: flutter, arguments: clean),
      // ExeProcess(commandMode: pubgetMode, command: flutter, arguments: pubget),
      // ExeProcess(commandMode: buildMode, command: flutter, arguments: build),
      // ExeProcess(commandMode: installMode, command: flutter, arguments: install),
      ExeProcess(commandMode: copyMode, command: copy, arguments: copyApk),
      // ExeProcess(commandMode: pushMode, command: git, arguments: push),
    ];
  }
}
