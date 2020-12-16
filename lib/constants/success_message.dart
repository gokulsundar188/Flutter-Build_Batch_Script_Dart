class SuccessMessage {
  String msg({String mode}) {
    switch (mode) {
      case 'pubget':
        return 'Pubget success';
      case 'clean':
        return 'Clean success';
      case 'build':
        return 'Build success';
      case 'install':
        return 'Install success';
      default:
        return 'process success';
    }
  }
}
