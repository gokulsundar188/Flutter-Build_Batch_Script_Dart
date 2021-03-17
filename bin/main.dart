import 'dart:io';

import 'package:console_full/constants/app_constants.dart';
import 'package:console_full/functions/exe_command.dart';
import 'package:console_full/model/process.dart';
import 'package:gsheets/gsheets.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';

void main(List<String> arguments) async {
  // gsheets
  // final gsheets = GSheets(credentials);
  // final ss = await gsheets.spreadsheet(spreadsheetId);
  // final sheetObj = await ss.worksheetByTitle(sheetName);

  var file = 'D:\\hippo_project\\6_Documents\\BuildStatus.xlsx';
  var bytes = File(file).readAsBytesSync();
  // var bytes = File(file).read;
  var excel = Excel.decodeBytes(bytes);
  var sheetObject = excel[sheetName];

  for (var table in excel.tables.keys) {
    print(table); //sheet Name
    print(excel.tables[table].maxCols);
    print(excel.tables[table].maxRows);
    for (var row in excel.tables[table].rows) {
      print("$row");
    }
  }

  var dir = Directory(projectFolder);
  var processList = ExeProcess.getProcesses();

  await for (FileSystemEntity entity
      in dir.list(recursive: false, followLinks: false)) {
    var type = await FileSystemEntity.type(entity.path);
    if (type == FileSystemEntityType.directory) {
      all_folders.add(entity.path);
    }
  }
  var index = 1;
  print(all_folders);

  for (var path in all_folders) {
    var splitText = path.toString().split('\\');
    var folderName = splitText[splitText.length - 1];

    Directory.current = path;
    // await Process.run('cd', ['$path']);

    print('$folderName redirected');
    // await sheetObj.values.insertValue(folderName, column: project_name_index, row: index);
    await sheetObject.updateCell(
        CellIndex.indexByColumnRow(
            columnIndex: project_name_index, rowIndex: index),
        folderName);
    for (var item in processList) {
      if (item.commandMode == installMode && install_apk) {
        await ExecuteCommand().executeCommand(
            commandMode: item.commandMode,
            command: item.command,
            arguments: item.arguments,
            column_index: index,
            sheet: sheetObject);
      } else if (item.commandMode != installMode) {
        if (item.commandMode == copyMode) {
        } else {
          await ExecuteCommand().executeCommand(
              commandMode: item.commandMode,
              command: item.command,
              arguments: item.arguments,
              column_index: index,
              sheet: sheetObject);
        }
      } else {
        print('install mode error');
      }
      await excel.encode().then((onValue) {
        File(join(file))
          ..createSync(recursive: true)
          ..writeAsBytesSync(onValue);
      });
    }
    await excel.encode().then((onValue) {
      File(join(file))
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
    index += 1;
  }
}
