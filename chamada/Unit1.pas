unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, Menus;

type
  TForm1 = class(TForm)
    lstAlunos: TListBox;
    MainMenu1: TMainMenu;
    Alunos1: TMenuItem;
    Cadastrar1: TMenuItem;
    Button1: TButton;
    btnApagarAluno: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cadastrar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnApagarAlunoClick(Sender: TObject);
  private
    procedure CarregarAlunos;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  unit2;

{$R *.dfm}

procedure TForm1.CarregarAlunos;
var
  I: Integer;
  Lista: TStringList;
  ArquivoIni: TIniFile;
begin
  Lista := TStringList.Create();

  ArquivoIni := TIniFile.Create('c:\alunos.ini');
  ArquivoIni.ReadSectionValues('Generica', Lista);
  ArquivoIni.Free();

  lstAlunos.Items.Clear();

  for I := 0 to Lista.Count-1 do
    lstAlunos.Items.Add(Lista.ValueFromIndex[I]);

  btnApagarAluno.Enabled := Lista.Count > 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CarregarAlunos();
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if (Key = VK_F5) then
    CarregarAlunos();
end;

procedure TForm1.Cadastrar1Click(Sender: TObject);
var
  Tela: TForm2;
begin
  Tela := TForm2.Create(Self);
  Tela.ShowModal();

  CarregarAlunos();
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ArquivoIni: TIniFile;
begin
  ArquivoIni := TIniFile.Create('c:\alunos.ini');
  ArquivoIni.EraseSection('Generica');
  ArquivoIni.Free();

  CarregarAlunos();

end;

procedure TForm1.btnApagarAlunoClick(Sender: TObject);
var
  ArquivoIni: TIniFile;
begin
  ArquivoIni := TIniFile.Create('c:\alunos.ini');
  //como fazer
  ArquivoIni.Free();

end;

end.


