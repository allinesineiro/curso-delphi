unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, ExtCtrls;

type
  TForm2 = class(TForm)
    edtCadastrar: TEdit;
    btnCadastrar: TButton;
    lblCadastrar: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Validar();
    procedure Cadastrar();
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  unit1;

{$R *.dfm}

procedure TForm2.btnCadastrarClick(Sender: TObject);
begin
  Cadastrar();
end;

procedure TForm2.Cadastrar();
var
  ID: integer;
  Arquivo: TIniFile;
begin
  try
    Validar();

    Arquivo := TIniFile.Create('c:\alunos.ini');
    try
      ID := Arquivo.ReadInteger('ID', 'Proximo', 1);

      Arquivo.WriteString('Generica', IntToStr(ID), edtCadastrar.Text);
      Arquivo.WriteInteger('ID', 'Proximo', ID + 1);

      edtCadastrar.Clear();
    finally
      Arquivo.Free();
    end;

  finally
    edtCadastrar.SetFocus();
  end;
end;

procedure TForm2.Validar();
begin
  if (edtCadastrar.Text = '') then
  begin
    ShowMessage('Informe o aluno!');
    Abort;  
  end;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_RETURN) then
    Cadastrar()
  else
    if (key = VK_ESCAPE) then
      Self.Close();
end;

end.
