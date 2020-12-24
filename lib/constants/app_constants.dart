String projectFolder = 'Project_Folder'; //Directory url
String destinationFolder = 'Destination_Folder'; //Directory url

bool install_apk = true;
bool copy_apk = false;
var all_folders = [];

//modes
String cleanMode = 'clean';
String pubgetMode = 'pubget';
String buildMode = 'build';
String installMode = 'install';
// String copyMode = 'copy';

// your google auth credentials
const credentials = r'''
{
 Google Api Key credentials 
}

''';

const spreadsheetId = ''; //Can get SpreadSheetId from your spread sheet Url
const sheetName = ''; //Sheet name
