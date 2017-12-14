unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormEditarRegistro = class(TForm)
    btnDesabilitarUac: TButton;
    btnHabilitarUac: TButton;
    btnRemoverSufixo: TButton;
    grpUac: TGroupBox;
    grpUpdater: TGroupBox;
    btn2: TButton;
    procedure btnDesabilitarUacClick(Sender: TObject);
    procedure btnHabilitarUacClick(Sender: TObject);
    procedure btnRemoverSufixoClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    procedure MudarValorDoUAC(Valor: Boolean);
    procedure SolicitarReinicioComAutorizacaoDoUsuario();
    procedure ReiniciarComputador();
  public
    { Public declarations }
  end;

var
  FormEditarRegistro: TFormEditarRegistro;

implementation

uses
  Registry;

{$R *.dfm}

function ShutDownWindows(Opcao: Byte):Boolean;
var
hToken : THandle;
pPrivileges : TTokenPrivileges;
pOldPrivileges: TTokenPrivileges;
Zero: DWord;
ptZero: DWord;
tResult: Boolean;
begin
//Checa a versão do Windows
//Se é NT/2000/XP então
//Ajusta os direitos 
if Win32Platform = VER_PLATFORM_WIN32_NT then
begin
tResult := OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken);
if tResult then
tResult := LookupPrivilegeValue(nil, 'SeShutdownPrivilege', pPrivileges.Privileges[0].Luid);

pPrivileges.PrivilegeCount := 1;
pPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
Zero := 0;
ptZero := SizeOf(pOldPrivileges);
if tResult then
Windows.AdjustTokenPrivileges(hToken,
False,
pPrivileges,
ptZero,
pOldPrivileges,
Zero);
end;
case Opcao of
//Desliga
0: begin
Result := ExitWindowsEx(EWX_SHUTDOWN or EWX_FORCE, 0);
end;
//Reinicia
1: begin
Result := ExitWindowsEx(EWX_REBOOT or EWX_FORCE, 0);
end;
//LogOff do usuário atual
2: begin
Result := ExitWindowsEx(EWX_LOGOFF or EWX_FORCE, 0);
end;
//Desliga, mas o sistema precisa ter o recurso de Power-Off
3: begin
Result := ExitWindowsEx(EWX_POWEROFF or EWX_FORCE, 0);
end;
else begin
Result := False;
Exit;
end;
end;
end;

procedure TFormEditarRegistro.MudarValorDoUAC(Valor: Boolean);
const
  CHAVE_UAC = 'Software\Microsoft\Windows\CurrentVersion\Policies\System';
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create();
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;

    if (Registro.OpenKey(CHAVE_UAC, True)) then
      Registro.WriteBool('EnableLUA', Valor);
  finally
    Registro.Free();
  end;
end;

procedure TFormEditarRegistro.SolicitarReinicioComAutorizacaoDoUsuario();
begin
  if (MessageDlg('O UAC foi modificado, deseja reiniciar o computador?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    ReiniciarComputador();
end;

procedure TFormEditarRegistro.ReiniciarComputador();
begin
  ShutDownWindows(1);
end;

procedure TFormEditarRegistro.btnDesabilitarUacClick(Sender: TObject);
begin
  MudarValorDoUAC(False);

  SolicitarReinicioComAutorizacaoDoUsuario();
end;

procedure TFormEditarRegistro.btnHabilitarUacClick(Sender: TObject);
begin
  MudarValorDoUAC(True);

  SolicitarReinicioComAutorizacaoDoUsuario();
end;

procedure TFormEditarRegistro.btnRemoverSufixoClick(Sender: TObject);
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create();
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    if Registro.OpenKey('SOFTWARE\WOW6432Node\ALTERDATA\Updater', True) then
    Registro.DeleteValue('sufixo');
    MessageDlg('Registro removido com sucesso.', mtInformation,[mbOK], 0);
  finally
    Registro.CloseKey();
    Registro.Free;
  end;
end;

procedure TFormEditarRegistro.btn2Click(Sender: TObject);
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create();
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    if Registro.OpenKey('SOFTWARE\WOW6432Node\ALTERDATA\Updater', True) then
      begin
        if Registro.ValueExists('sufixo') = True  then
          begin
            MessageDlg('Registro já existe.', mtInformation,[mbOK], 0);
            Exit;
          end
        else
        begin
          if Registro.ValueExists('sufixo') = False then
          Registro.WriteString('sufixo', 'teste');
          MessageDlg('Registro criado com sucesso.', mtInformation,[mbOK], 0);
        end;
      end;
  finally
    Registro.CloseKey();
    Registro.Free;
    end;
end;
end.

