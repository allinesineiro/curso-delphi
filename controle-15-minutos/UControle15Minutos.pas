unit UControle15Minutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils;

type
  TForm1 = class(TForm)
    btnIniciar: TButton;
    lblInicial: TLabel;
    btnFinalizar: TButton;
    lblFinal: TLabel;
    lblResultado: TLabel;
    tmrCronometro: TTimer;
    procedure btnIniciarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure tmrCronometroTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    private
    HoraInicial: TDateTime;
    HoraFinal: TDateTime;
  public
      { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.btnIniciarClick(Sender: TObject);
begin
  HoraInicial := now();

  lblInicial.Caption := 'Marcou o ponto em: ' + DateToStr(HoraInicial) + ' às ' +  TimeToStr(HoraInicial);
  lblInicial.Visible := True;

  tmrCronometro.Enabled := True;
  lblResultado.Visible := True;
end;

procedure TForm1.btnFinalizarClick(Sender: TObject);
begin
  HoraFinal := now();
  tmrCronometro.Enabled := False;

  lblFinal.Caption := 'Marcou o ponto em: ' + DateToStr(HoraInicial) + ' às ' +  TimeToStr(HoraFinal);
  lblFinal.Visible := True;

  lblResultado.Caption := 'O tempo gasto foi de ' + TimeToStr(HoraInicial - HoraFinal);
  lblResultado.Visible := True;
end;

procedure TForm1.tmrCronometroTimer(Sender: TObject);
begin
  lblResultado.Caption := FormatDateTime('HH:MM:SS:ZZZ', now() -  horainicial);
end;

procedure TForm1.FormCreate(Sender: TObject);
const
  DUAS_HORAS = 7200000;
begin
  tmrCronometro.Interval := DUAS_HORAS;




end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Data: TDatetime;
begin
  Data := StrToDate('01/01/2015');

  if (IsInLeapYear(Data)) then
    Showmessage('o ano é bissexto')
  else
    Showmessage('não é');

end;

end.
