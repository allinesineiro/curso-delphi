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
  private
    { Private declarations }
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
var
  Lista: TStringList;
  Arquivo: TIniFile;
begin
  Lista := TStringList.Create();
  Arquivo := TIniFile.Create('c:\alunos.ini');
  Arquivo.ReadSectionValues('Generica', Lista);

  Arquivo.WriteString('Generica', 'Aluno' + IntToStr(Lista.count + 1), edtCadastrar.Text);

  Arquivo.Free();
  Lista.Free();

  edtCadastrar.Clear;
end;


end.
