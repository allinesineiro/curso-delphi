unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, StrUtils;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Timer1: TTimer;
    lblDuracao: TLabel;
    BitBtn1: TBitBtn;
    podium: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
     Inicio: TDateTime;

     function FormatarData(Data: TDateTime): string;
     function JaChegou(Nome: string): Boolean;
     function CorridaJaAcabou: Boolean;
     Procedure MarcarChegada(Nome: string);
     procedure IniciarProva;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.IniciarProva;
begin
  ListBox1.Clear();
  Inicio := Now();
  Timer1.Enabled := True;
  lblDuracao.Visible := True;

  Image1.Picture := nil;
  Image2.Picture := nil;
  Image3.Picture := nil;
  podium.Visible := False;  
end;

function TForm1.FormatarData(Data: TDateTime): string;
begin
  Result := FormatDateTime('HH:MM:SS:ZZZ', Data);
end;

function TForm1.CorridaJaAcabou: Boolean;
begin
  if (ListBox1.Count = 10) then
    Result := True
  else
    Result := False;
end;

function TForm1.JaChegou(Nome: string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to ListBox1.Count-1 do
  begin
    if (StrUtils.AnsiContainsText(ListBox1.Items[I], Nome)) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TForm1.MarcarChegada(Nome: string);
var
  Total, Posicao : Integer;
  Chegada: TDateTime;
  Texto: String;
begin
  if (JaChegou(Nome)) then
    Exit;

  Chegada := Now() - Inicio;
  Total := ListBox1.Items.Count;
  Posicao := Total +1;

  case Posicao of
    1:
      if FileExists('C:\Desenvolvimento\curso-delphi\ordem-de-chegada\img\'+Nome+'.bmp') then
        Image1.Picture.LoadFromFile('C:\Desenvolvimento\curso-delphi\ordem-de-chegada\img\'+Nome+'.bmp');

    2:
      if FileExists('C:\Desenvolvimento\curso-delphi\ordem-de-chegada\img\'+Nome+'.bmp') then
        Image2.Picture.LoadFromFile('C:\Desenvolvimento\curso-delphi\ordem-de-chegada\img\'+Nome+'.bmp');

    3:
      if FileExists('C:\Desenvolvimento\curso-delphi\ordem-de-chegada\img\'+Nome+'.bmp') then
        Image3.Picture.LoadFromFile('C:\Desenvolvimento\curso-delphi\ordem-de-chegada\img\'+Nome+'.bmp');
  end;

  Texto := FormatarData(Chegada);
  Texto := Texto + ' ' + IntTostr(Posicao) + ' º lugar - ' + Nome;
  ListBox1.Items.Add(Texto);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  CaractereCorrespondente: Char;
begin
  if (ssctrl in Shift) and (Key = VK_F5) then
  begin
    IniciarProva();
    Exit;
  end;

  if (CorridaJaAcabou()) then
    Exit;
    
  CaractereCorrespondente := Char(Key);

  case CaractereCorrespondente of
    '1': MarcarChegada('Nathalia');
    '2': MarcarChegada('Alline');
    '3': MarcarChegada('Andrade');
    '4': MarcarChegada('Cassia');
    '5': MarcarChegada('Marcelo');
    '6': MarcarChegada('Vinicius');
    '7': MarcarChegada('Tatiana');
    '8': MarcarChegada('Andre');
    '9': MarcarChegada('Priscila');
    '0': MarcarChegada('Francisco');
  end;

  if (CorridaJaAcabou()) then
  begin
    Timer1.Enabled := False;
    lblDuracao.Caption := 'A corrida acabou! Teve duração de ' + FormatarData(Now() - Inicio);
    lblDuracao.Font.Color := $0000B97C;
    podium.Visible := True;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  TempoQueJaPassou: TDatetime;
begin
  TempoQueJaPassou := Now() - Inicio;

  lblDuracao.Caption := 'A prova iniciou em: ' + FormatarData(Inicio) + ' já se passaram ' + FormatarData(TempoQueJaPassou);
  lblDuracao.Font.Color := $00252525;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  IniciarProva();
end;

end.
