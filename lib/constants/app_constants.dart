String projectFolder =
    'D:\\hippo_project\\1_Project_code\\2_LiveProjects\\gokul_projects\\idr_projects'; //Directory url
String destinationFolder = 'Destination_Folder'; //Directory url

bool install_apk = true;
bool copy_apk = false;
var all_folders = [];

//flutter modes
String cleanMode = 'clean';
String pubgetMode = 'pubget';
String buildMode = 'build';
String installMode = 'install';
String copyMode = 'copy';

// git mode
String pushMode = 'push';
String pullMode = 'pull';
String cloneMode = 'clone';
String checkOutMode = 'checkout';

// your google auth credentials
const credentials = r'''
{
  
}

''';

const spreadsheetId = ''; //Can get SpreadSheetId from your spread sheet Url
const sheetName = 'Sheet1'; //Sheet name
