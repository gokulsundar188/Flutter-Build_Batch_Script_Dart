import 'dart:io';

import 'package:console_full/constants/app_constants.dart';
import 'package:console_full/functions/exe_command.dart';
import 'package:console_full/model/process.dart';

void main(List<String> arguments) async {
  var dir = Directory(projectFolder);
  var processList = ExeProcess.getProcesses();

  await for (FileSystemEntity entity
      in dir.list(recursive: false, followLinks: false)) {
    var type = await FileSystemEntity.type(entity.path);
    if (type == FileSystemEntityType.directory) {
      all_folders.add(entity.path);
    }
  }

  for (var path in all_folders) {
    var splitText = path.toString().split('/');
    print(splitText[splitText.length - 1]);

    Directory.current = path;
    for (var item in processList) {
      if (item.commandMode == installMode && install_apk) {
        await ExecuteCommand().executeCommand(
            commandMode: item.commandMode,
            command: item.command,
            arguments: item.arguments);
      } else if (item.commandMode != installMode) {
        await ExecuteCommand().executeCommand(
            commandMode: item.commandMode,
            command: item.command,
            arguments: item.arguments);
      }else{
        print('install mode error');
      }
    }
  }
}
