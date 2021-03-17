import 'dart:io';

import 'package:console_full/constants/message.dart';
import 'package:excel/excel.dart';
import 'package:gsheets/gsheets.dart';

class ExecuteCommand {
  Message message = Message();
  ProcessResult result;
  Future executeCommand(
      {String commandMode,
      String nextProcessMode,
      String command,
      var arguments,
      Sheet sheet,
      int column_index}) async {
    await Process.run(command, arguments, runInShell: true)
        .then((ProcessResult res) {
      result = res;
      if (result.exitCode != 0) {
        print(result.stderr);
        print(message.msg(mode: commandMode).errMsg);
        sheet.updateCell(
            CellIndex.indexByColumnRow(
                columnIndex: message.msg(mode: commandMode).row,
                rowIndex: column_index),
            result.stderr);
        // sheet.values.insertValue(result.stderr,
        //     column: message.msg(mode: commandMode).row, row: column_index);
      } else {
        print(result.stdout);
        print(message.msg(mode: commandMode).successMsg);
        sheet.updateCell(
            CellIndex.indexByColumnRow(
                columnIndex: message.msg(mode: commandMode).row,
                rowIndex: column_index),
            message.msg(mode: commandMode).successMsg);
        // sheet.values.insertValue(message.msg(mode: commandMode).successMsg,
        //     column: message.msg(mode: commandMode).row, row: column_index);
      }
    });
    return result;
  }

  // Future executeCopyCommand(
  //     {String commandMode,
  //     String nextProcessMode,
  //     String command,
  //     var arguments,
  //     Worksheet sheet,
  //     int column_index}) async {
  //   await Process.run(command, arguments, runInShell: true)
  //       .then((ProcessResult res) {
  //     result = res;
  //     if (result.exitCode != 0) {
  //       print(result.stderr);
  //       print(message.msg(mode: commandMode).errMsg);
  //       sheet.values.insertValue(result.stderr,
  //           column: message.msg(mode: commandMode).row, row: column_index);
  //     } else {
  //       print(result.stdout);
  //       print(message.msg(mode: commandMode).successMsg);
  //       sheet.values.insertValue(message.msg(mode: commandMode).successMsg,
  //           column: message.msg(mode: commandMode).row, row: column_index);
  //     }
  //   });
  //   return result;
  // }
}
