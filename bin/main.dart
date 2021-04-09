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

  var file = await File(reportFile);
  var bytes = await file.readAsBytesSync();
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
      if (item.commandMode == installMode) {
        await ExecuteCommand().executeCommand(
            commandMode: item.commandMode,
            command: item.command,
            arguments: item.arguments,
            column_index: index,
            sheet: sheetObject);
      } else if (item.commandMode == copyMode) {
        print('copy');
        path = '$projectFolder\\$folderName\\build\\app\\outputs\\apk\\release';

        await copy(
          path: path,
          destinationPath: '$destinationFolder\\$folderName',
          folderName: folderName,
        );
      } else {
        await ExecuteCommand().executeCommand(
            commandMode: item.commandMode,
            command: item.command,
            arguments: item.arguments,
            column_index: index,
            sheet: sheetObject);
      }
      await excel.encode().then((onValue) {
        File(join(reportFile))
          ..createSync(recursive: true)
          ..writeAsBytesSync(onValue);
      });
    }
    await excel.encode().then((onValue) {
      File(join(reportFile))
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
    index += 1;
  }
  print('All process done');
}

void copy({String path, String destinationPath, String folderName}) async {
  try {
    var root = await Directory(path);
    if (root.existsSync()) {
      for (var f in root.listSync()) {
        if (f.path.contains('v7a')) {
          print(f.path);
          await Directory(destinationPath).exists().then((isExsist) async {
            if (isExsist) {
              await copyFile(
                  file: f.path, newPath: '$destinationPath\\$folderName');
            } else {
              await Directory(destinationPath)
                  .create(recursive: true)
                  .then((Directory directory) async {
                await copyFile(
                    file: f.path, newPath: '$destinationPath\\$folderName');
              });
            }
          });
        }
      }
    } else {
      print('Path not found');
    }
  } catch (e) {
    print(e.toString());
  }
}

void copyFile({String file, String newPath}) async {
  try {
    var f = File(file);
    await f.copy('${newPath}.apk').then((r) {
      print(r);
    }).catchError((e) {
      print(e.toString());
    });
  } catch (e) {
    print(e.toString());
  }
}
