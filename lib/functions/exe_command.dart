import 'dart:io';

import 'package:console_full/constants/error_message.dart';
import 'package:console_full/constants/success_message.dart';

class ExecuteCommand {
  SuccessMessage successMessage = SuccessMessage();
  ErrorMessage errorMessage = ErrorMessage();
  ProcessResult result;
  Future executeCommand({
    String commandMode,
    String nextProcessMode,
    String command,
    var arguments,
  }) async {
    await Process.run(command, arguments).then((ProcessResult res) {
      result = res;
      if (result.exitCode != 0) {
        print(result.stderr);
        print(errorMessage.msg(mode: commandMode));
      } else {
        print(result.stdout);
        print(successMessage.msg(mode: commandMode));
      }
    });
    return result;
  }
}
