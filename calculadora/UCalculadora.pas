//application.messagebox
unit UCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TCalculadora = class(TForm)
    edtValor1: TEdit;
    edtValor2: TEdit;
    btnSomar: TButton;
    btnSubtrair: TButton;
    btnMultiplicar: TButton;
    btnDividir: TButton;
    edtResultado: TEdit;
    lblCasasDecimais: TLabel;
    edtCasasDecimais: TEdit;
    Label1: TLabel;
    btnLimpar: TButton;
    procedure btnSomarClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
    procedure edtCasasDecimaisExit(Sender: TObject);
    procedure edtCasasDecimaisKeyPress(Sender: TObject; var Key: Char);
    procedure edtValor1KeyPress(Sender: TObject; var Key: Char);
    procedure edtValor2KeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
  private
    function ObterValor1(): Double;
    function ObterValor2(): Double;
    function ObterCasasDecimais(): Integer;

    procedure ExibirResultado(Resultado: Double);

    procedure ImpedirTeclasNaoNumericas(var Tecla: Char; PermiteVirgula: Boolean; Texto: string);
  public
    { Public declarations }
  end;

var
  Calculadora: TCalculadora;

implementation

uses
  StrUtils;

{$R *.dfm}

procedure TCalculadora.btnSomarClick(Sender: TObject);
var
  Resultado: Double;
begin
  Resultado := ObterValor1() + ObterValor2();

  ExibirResultado(Resultado);
end;

procedure TCalculadora.btnSubtrairClick(Sender: TObject);
var
  Resultado: Double;
begin
  Resultado := ObterValor1() - ObterValor2();

  ExibirResultado(Resultado);
end;

procedure TCalculadora.btnMultiplicarClick(Sender: TObject);
var
  Resultado: Double;
begin
  Resultado := ObterValor1() * ObterValor2();

  ExibirResultado(Resultado);
end;

procedure TCalculadora.btnDividirClick(Sender: TObject);
var
  Resultado: Double;
begin
  Resultado := ObterValor1() / ObterValor2();

  ExibirResultado(Resultado);
end;

function TCalculadora.ObterValor1(): Double;
begin
     if edtValor1.Text = '' then
      ShowMessage('Antes de continuar digite o valor')
     else
      Result := StrToFloat(edtValor1.Text);

end;

function TCalculadora.ObterValor2(): Double;
begin
  if edtValor2.Text = '' then
    ShowMessage('Antes de continuar digite o valor')
  else
    Result := StrToFloat(edtValor2.Text);
end;

function TCalculadora.ObterCasasDecimais(): Integer;
begin
  Result := StrToInt(edtCasasDecimais.Text);
end;

procedure TCalculadora.ExibirResultado(Resultado: Double);
begin
  edtResultado.Text := Formatfloat('#0.' + StringOfChar('0', ObterCasasDecimais()), Resultado);
end;

procedure TCalculadora.edtCasasDecimaisExit(Sender: TObject);
begin
  if (edtCasasDecimais.Text = '') then
    edtCasasDecimais.Text := '2'
  else
    if (ObterCasasDecimais() > 5) then
      edtCasasDecimais.Text := '5';
end;

procedure TCalculadora.ImpedirTeclasNaoNumericas(var Tecla: Char; PermiteVirgula: Boolean; Texto: string);
begin
  if (Tecla >= '0') and (Tecla <= '9') then
    Exit;

  if (Tecla >= '-') then
    begin
      if (not AnsiContainsText(Texto, '-') and (Texto = '')) then
        Exit;
    end;

  if (Tecla = Char(VK_BACK)) then
    Exit;

  if (PermiteVirgula) and (Tecla = ',') then
    if (not AnsiContainsText(Texto, ',') and (Texto <> '')) then
      Exit;

  Tecla := #0;
end;

procedure TCalculadora.edtCasasDecimaisKeyPress(Sender: TObject; var Key: Char);
begin
  ImpedirTeclasNaoNumericas(Key, False, edtCasasDecimais.Text);
end;

procedure TCalculadora.edtValor1KeyPress(Sender: TObject; var Key: Char);
begin
  ImpedirTeclasNaoNumericas(Key, True, edtValor1.Text);
end;

procedure TCalculadora.edtValor2KeyPress(Sender: TObject; var Key: Char);
begin
  ImpedirTeclasNaoNumericas(Key, True, edtValor2.Text);
end;

procedure TCalculadora.btnLimparClick(Sender: TObject);
begin
    edtValor1.Clear;
    edtValor2.Clear;
    edtResultado.Clear;
end;

end.

