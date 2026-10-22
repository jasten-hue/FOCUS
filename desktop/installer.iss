#ifndef AppVersion
  #define AppVersion "1.0.0"
#endif

[Setup]
AppId={{B7C1D6E2-3F4A-4C8B-9A21-5E7D0F1A2B33}
AppName=Focus Test Log Analyzer
AppVersion={#AppVersion}
DefaultDirName={autopf}\FocusTestLogAnalyzer
DefaultGroupName=Focus Test Log Analyzer
OutputDir=Output
OutputBaseFilename=FocusTestLogAnalyzer-Setup
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=lowest
ArchitecturesInstallIn64BitMode=x64compatible
UninstallDisplayIcon={app}\FocusTestLogAnalyzer.exe

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; Flags: unchecked

[Files]
Source: "dist\FocusTestLogAnalyzer\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion

[Icons]
Name: "{group}\Focus Test Log Analyzer"; Filename: "{app}\FocusTestLogAnalyzer.exe"
Name: "{autodesktop}\Focus Test Log Analyzer"; Filename: "{app}\FocusTestLogAnalyzer.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\FocusTestLogAnalyzer.exe"; Description: "Launch Focus Test Log Analyzer"; Flags: nowait postinstall skipifsilent
