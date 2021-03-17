String projectFolder =
    'D:\\hippo_project\\1_Project_code\\2_LiveProjects\\gokul_projects\\idr_projects\\st11'; //Directory url
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
String addMode = 'add';
String commitMode = 'commit';
String pushMode = 'push';
String pullMode = 'pull';
String cloneMode = 'clone';
String checkOutMode = 'checkout';

//message indexes
var project_name_index = 0;
var clean_index = 1;
var build_index = 2;
var pub_index = 3;
var install_index = 4;
var copy_index = 5;
var clone_index = 6;
var checkout_index = 7;
var add_index = 8;
var commit_index = 9;
var pull_index = 10;
var push_index = 11;
var common_index = 12;

// your google auth credentials
const credentials = r'''
{
  "type": "service_account",
  "project_id": "buildstatus-302410",
  "private_key_id": "5b0666d0255ca4f417110e0c4fffa76a047fdc43",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDwPu5VI04o2Dee\nZPMkGyOuUCTQPDGcgOqdVqaUmAt2mj3okC5kxjjSBfcyg6L9/h7vyHoW0IJ8Y/uJ\nnF9xoTMbTQ5q+JRDqZ/j1PGCZHIxMuxKJ9FTaGC9ILNuFvobcj5phjQTvYqVrmJJ\nsCnpQuqcJO0mvKApBNal8E6ucAHPJTEDqF1Oed/FTa1k5drisi4GJblv+qM2BTeL\njaCt3fQ1E4qfe+PiXq6uEmP+XqR4vH+LVUDbP4A1zF2syy31Ep4lVDGDeDteP6Te\n6qEg1z14GF98eGy5iBxuXRhbhvvr4wMMDyBwQbbtWZGbAW8yb48GxQ31zy8nvPR8\ng58TICLJAgMBAAECggEAZOPorrRO5HQ4lzoJqYYEK/XYH+LHatPwsvZqqkhXuAz6\nJqo18XgU8I40y2/giQ2o7EWij+YshhRu09Fpe4yYq8RmY6HUkb2wObt5WKraEbMy\n68lg7MgOqB4NfBQGIHSPpT0IramRg15iRFPIpf7GC6CuPvBDyjYP9ku+nx7Gg7ho\nSN7BapY6ca/UZiONGGF/dAzrodRaz7jznQg0Pqv1hWibtKnW1huYWLRA+kqhqkiy\nNewQOV6iex6mECfNmL+nz+3Rx+RzlHzz2GPbHevOZPBOB3IM+8vjNoZRcWMEjkLM\nQHHu9H3YWt6qM+SvDB//ktf4XHBEYns7sC7d5wCOKQKBgQD+qJwO6itoXNIseX5I\nitY76U+UjtbSHQqk9zGotslepnyizkfIHOGnRVi1PwFvmJ4jlugkvdmi4QaKFgAI\nRnWF7ChHOYX968NpPSO5gUp3ombunuPHonSXkDg9NF06elQhun7SulDgilHSxuwU\nMZpnTeOOcxyz9Sqt+D3O/GwRhwKBgQDxguL8UfeKz+oLKTSIBN1EpB3ASNDzpKeS\nIhl38p0crbruBNT50ic57s/0Jr8KrLbdTDsyILhMFDCxBEGwkbYJU3FdL319metY\n624iaWfcZMO8znlZj+pI4wp+2J2eFd5Uf6kzSkHnGsP7c4+umVUvlWPXF1Ant7M9\nKic1qfZ9LwKBgHQFGWRqJ3CaqV5905z1M/mDqDAEi7aaaJkTzdoRvNiUfUAnPuja\nz6vHmkyo8dyH6bRJMmZa4GamorYSo90hTLXBC/C3MmanHRY7NqVzVBwBL2gTl68C\nQqAyooyv6LGVvfLH5rPXErXaDsE6w5/HoZLjF4N0ymTqk5FDAdXlhs7NAoGAW9n4\ntBgEeoG6tIX2Wajn8nwsaH4JIjDEHnrjjs/x2v9j8bRav6yiiJD//A5kaA3p+l5M\nwTLahOzE2/4PcbTpM8DNg7BVHNjWPlpD58iI3LRiEUPBuUNXymK3EikWQRJ2HVL0\nKfKa/+cZFGAODEx6rn81mo9eR8zA2YlXojxC57cCgYEAiAY0qCgIYh4hm5yknnWH\nuk5/+n+N1RU7pAfKmlHxufzYYwAnnl5tLS/t9Gyoa7hKavH902BCyOEu5a31LoXb\nFgMoP+yrZgE5UA0tT5z74e2aoJl4ngzIUzWh4u1mS0fUwulNpG/3UeUpnFGHTBM9\nCVcmQBAJi7txiPS/xJch/jc=\n-----END PRIVATE KEY-----\n",
  "client_email": "buildstatus@buildstatus-302410.iam.gserviceaccount.com",
  "client_id": "108189301115126235278",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/buildstatus%40buildstatus-302410.iam.gserviceaccount.com"
}


''';

const spreadsheetId =
    '1uv8xA8YuSjuT-kREk9Oy3gUamCH_HsR16PbD-jw5nds'; //Can get SpreadSheetId from your spread sheet Url
const sheetName = 'Sheet1'; //Sheet name
