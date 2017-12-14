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
    btnApagarTodos: TButton;
    btnApagarAluno: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cadastrar1Click(Sender: TObject);
    procedure btnApagarTodosClick(Sender: TObject);
    procedure btnApagarAlunoClick(Sender: TObject);

  private
    procedure CarregarAlunos;
    procedure ApagarAluno;

    procedure Cadastrar;

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
    CarregarAlunos()
  else
    if (Key = VK_DELETE) then
      ApagarAluno()
    else
      if (Key = VK_INSERT) then
        Cadastrar();      
end;

procedure TForm1.Cadastrar1Click(Sender: TObject);
begin
  Cadastrar();
end;

procedure TForm1.btnApagarTodosClick(Sender: TObject);
var
  ArquivoIni: TIniFile;
begin
  ArquivoIni := TIniFile.Create('c:\alunos.ini');
  ArquivoIni.EraseSection('Generica');
  ArquivoIni.EraseSection('ID');
  ArquivoIni.Free();

  CarregarAlunos();
end;

procedure TForm1.btnApagarAlunoClick(Sender: TObject);
begin
  ApagarAluno();
end;

procedure TForm1.ApagarAluno;
var
  I: Integer;
  Lista: TStringList;
  ArquivoIni: TIniFile;
var
  AlunoSelecionado: string;
begin
  try
    AlunoSelecionado := lstAlunos.Items[lstAlunos.ItemIndex];

    if (SameText(AlunoSelecionado, 'Cassia')) then
      raise Exception.Create('ninguem toca');

    Lista := TStringList.Create();
    try
      ArquivoIni := TIniFile.Create('c:\alunos.ini');
      try
        ArquivoIni.ReadSectionValues('Generica', Lista);

        for I := 0 to Lista.Count - 1 do
        begin
          if (Lista.ValueFromIndex[I] = AlunoSelecionado) then
          begin
            ArquivoIni.DeleteKey('Generica', Lista.Names[I]);
            Break;
          end;
        end;
      finally
        ArquivoIni.Free();
      end;
    finally
      Lista.Free();
    end;

    CarregarAlunos();
  except
    on E:EStringListError do
    begin
      ShowMessage('ninguem selecionado!');
    end;
  end;
end;

procedure TForm1.Cadastrar;
var
  Tela: TForm2;
begin
  Tela := TForm2.Create(Self);
  Tela.ShowModal();

  CarregarAlunos();
end;

end.


