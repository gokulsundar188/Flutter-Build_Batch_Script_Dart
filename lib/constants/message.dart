import 'package:console_full/constants/app_constants.dart';
import 'package:console_full/constants/commands.dart';

class RowColumn {
  int row;
  String errMsg;
  String successMsg;
  RowColumn({this.row, this.errMsg, this.successMsg});
}

class Message {
  RowColumn msg({String mode}) {
    switch (mode) {
      case 'pubget':
        return RowColumn(
            errMsg: 'Pubget error',
            successMsg: 'Pubget Completed',
            row: pub_index);
      case 'clean':
        return RowColumn(
            errMsg: 'Clean error',
            successMsg: 'Clean Completed',
            row: clean_index);
      case 'copy':
        return RowColumn(
            errMsg: 'copy error',
            successMsg: 'copy Completed',
            row: clean_index);
      case 'build':
        return RowColumn(
            errMsg: 'Build error',
            successMsg: 'Build Completed',
            row: build_index);
      case 'install':
        return RowColumn(
            errMsg: 'Install error',
            successMsg: 'Install Completed',
            row: install_index);
      case 'add':
        return RowColumn(
            errMsg: 'add error', successMsg: 'add Completed', row: add_index);
      case 'commit':
        return RowColumn(
            errMsg: 'commit error',
            successMsg: 'commit Completed',
            row: commit_index);
      case 'pull':
        return RowColumn(
            errMsg: 'pull error',
            successMsg: 'pull Completed',
            row: pull_index);
      case 'push':
        return RowColumn(
            errMsg: 'push error',
            successMsg: 'push Completed',
            row: push_index);
      default:
        return RowColumn(
            errMsg: 'Process error',
            successMsg: 'Process Completed',
            row: common_index);
    }
  }
}
