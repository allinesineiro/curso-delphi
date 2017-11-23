unit UOrdemDeChegada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure MostrarChegada(NomeAluno: String);

  public
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.MostrarChegada(NomeAluno: String);
Var
  Chegada: TDateTime;
  Texto: String;
  Ordem: Integer;
  Nome: String;

begin
  Chegada:= Now();
  Ordem:= ListBox1.Items.Count;
  Texto:=  IntToStr(Ordem) + '� lugar ' + '- tempo: ' + TimeToStr(Chegada) + ' - ' + NomeAluno;
  ListBox1.Items.Add(Texto);
end;

procedure TForm1.Button1Click(Sender: TObject);

begin
  MostrarChegada('Click do Bot�o');
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if (key = VK_F1) then
    MostrarChegada('Natalia')
  else
    if (key = VK_F2) then
      MostrarChegada('Alline')
    else
      if (key = VK_F3) then
        MostrarChegada('Andrade')
      else
        if (key = VK_F4) then
          MostrarChegada('Cassia')
      else
        if (key = VK_F5) then
        MostrarChegada('Marcelo')
        else
          if (key = VK_F6) then
          MostrarChegada('Vinicius')
          else
            if (key = VK_F7) then
            MostrarChegada('Tatiana')
            else
              if (key = VK_F8) then
              MostrarChegada('Andr�')
              else
              if (key = VK_F9) then
                MostrarChegada('Priscila')
              else
                if (key = VK_F10) then
                MostrarChegada('Francisco')
end;

end.
