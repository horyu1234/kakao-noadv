program KakaoPC_NoAdv;

uses
  Forms,
  Windows,
  Messages,
  unitKakao in 'unitKakao.pas' {frmRemoveKakaoAD};

{$R *.res}

var
  Mutex: THandle;

begin
  Mutex := CreateMutex(nil, True, 'NoDuplicate');
  if (Mutex <> 0) and (GetLastError = 0) then begin
    Application.Initialize;
    Application.CreateForm(TfrmRemoveKakaoAD, frmRemoveKakaoAD);
    Application.Run;
    if Mutex <> 0 then CloseHandle(Mutex);
  end
  else begin
    Application.MessageBox('���α׷��� �̹� �������Դϴ�.', '���', MB_OK);
    Application.Terminate;
  end;
end.
