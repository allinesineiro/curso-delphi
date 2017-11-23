unit UControle15Minutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils, jpeg;

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
  lblFinal.Visible := false;

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

var
  TempoGasto: TDateTime;

begin
  TempoGasto := (Now() - horainicial);

  lblResultado.Caption := FormatDateTime('HH:MM:SS:ZZZ', TempoGasto);


  if (DateUtils.SecondOf(TempoGasto) >= 5) then
    lblResultado.Font.Color := clRed
  else
    lblResultado.Font.Color := clblue;
end;

end.
