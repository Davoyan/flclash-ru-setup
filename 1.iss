[Languages]
Name: "Russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Setup]
AppId={{f6897eb3-92e7-4114-b1d7-9222a5cf55d5}}
AppName=FLClash
AppVersion=0.8.84
AppVerName=FLClash
DefaultDirName={localappdata}\Programs\FLClash
DefaultGroupName=FLClash
UninstallDisplayIcon={app}\FLClash.exe
OutputBaseFilename=FLClashSetup
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest
WizardStyle=modern
SetupIconFile=C:\Users\Davoyan\Desktop\FLClash-Setting-Build\Untitled-1.ico

[CustomMessages]
AppVersion=
SetupVersion=
UninstallVersion=

[Files]
Source: "C:\Users\Davoyan\Desktop\FLClash-build\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
Source: "C:\Users\Davoyan\Desktop\FLClash-Setting-Build\*"; DestDir: "{userappdata}\com.follow\clash"; Flags: ignoreversion recursesubdirs


[Icons]
Name: "{userdesktop}\FLClash"; Filename: "{app}\FLClash.exe"

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
Type: filesandordirs; Name: "{userappdata}\com.follow\clash"

[Code]
procedure RemoveDirIfExists(const Dir: string);
begin
  if DirExists(Dir) then
  begin
    DelTree(Dir, True, True, True);
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
  begin
    // Удаление каталогов перед копированием файлов
    RemoveDirIfExists(ExpandConstant('{app}'));
    RemoveDirIfExists(ExpandConstant('{userappdata}\com.follow\clash'));
  end;
end;

procedure InitializeWizard();
begin
  WizardForm.Caption := 'FLClash';
end;
