class ErrorMessage {
  String msg({String mode}) {
    switch (mode) {
      case 'pubget':
        return 'Pubget error';
      case 'clean':
        return 'Clean error';
      case 'build':
        return 'Build error';
      case 'install':
        return 'Install error';
      default:
        return 'Process error';
    }
  }
}
