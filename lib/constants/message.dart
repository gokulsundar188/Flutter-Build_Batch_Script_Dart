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
            errMsg: 'Pubget error', successMsg: 'Pubget Completed', row: 4);
      case 'clean':
        return RowColumn(
            errMsg: 'Clean error', successMsg: 'Clean Completed', row: 2);
      case 'build':
        return RowColumn(
            errMsg: 'Build error', successMsg: 'Build Completed', row: 3);
      case 'install':
        return RowColumn(
            errMsg: 'Install error', successMsg: 'Install Completed', row: 5);
      default:
        return RowColumn(
            errMsg: 'Prcess error', successMsg: 'Pubget Completed', row: 1);
    }
  }
}

// project_name_index = 1
// clean_index = 2
// build_index = 3
// pub_index = 4
// install_index = 5
// copy_index = 6
// clone_index = 7
// checkout_index = 8
