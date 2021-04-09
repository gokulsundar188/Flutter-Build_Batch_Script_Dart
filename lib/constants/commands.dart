//commands
import 'package:console_full/constants/app_constants.dart';

String flutter = 'flutter';
String git = 'git';
String copy = 'copy';

//flutter arguments
var clean = ['clean'];
var pubget = ['pub', 'get'];
var build = ['build', 'apk', '--split-per-abi', '--no-tree-shake-icons'];
var install = ['install', 'apk'];
var copyApk = [
  '$projectFolder\\build\\app\\outputs\\apk\\release\\app-armeabi-v7a-release.apk',
  destinationFolder
];
var add = ['add', '.'];
var commit = ['commit', '-am', 'Code merge v1.37.8'];
var pull = ['pull', 'origin', 'develop'];
var push = ['push', 'origin', 'develop'];
var checkout = ['checkout', 'develop'];
