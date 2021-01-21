import 'dart:io';

import 'package:console_full/constants/app_constants.dart';
import 'package:console_full/functions/exe_command.dart';
import 'package:console_full/model/process.dart';
import 'package:gsheets/gsheets.dart';

void main(List<String> arguments) async {
  // gsheets
  final gsheets = GSheets(credentials);
  final ss = await gsheets.spreadsheet(spreadsheetId);
  final sheetObj = await ss.worksheetByTitle(sheetName);

  var dir = Directory(projectFolder);
  var processList = ExeProcess.getProcesses();

  await for (FileSystemEntity entity
      in dir.list(recursive: false, followLinks: false)) {
    var type = await FileSystemEntity.type(entity.path);
    if (type == FileSystemEntityType.directory) {
      all_folders.add(entity.path);
    }
  }
  var index = 2;
  print(all_folders);

  for (var path in all_folders) {
    var splitText = path.toString().split('\\');
    var folderName = splitText[splitText.length - 1];

    Directory.current = path;
    // await Process.run('cd', ['$path']);

    print('$folderName redirected');
    await sheetObj.values.insertValue(folderName, column: 1, row: index);
    for (var item in processList) {
      if (item.commandMode == installMode && install_apk) {
        await ExecuteCommand().executeCommand(
            commandMode: item.commandMode,
            command: item.command,
            arguments: item.arguments,
            column_index: index,
            sheet: sheetObj);
      } else if (item.commandMode != installMode) {
        if (item.commandMode == copyMode) {
        } else {
          await ExecuteCommand().executeCommand(
            commandMode: item.commandMode,
            command: item.command,
            arguments: item.arguments,
            column_index: index,
            sheet: sheetObj);
        }
        
      } else {
        print('install mode error');
      }
    }
    index += 1;
  }
}
