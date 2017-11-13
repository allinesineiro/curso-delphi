unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    lblNumero: TLabel;
    edtNumero: TEdit;
    btnCalcular: TButton;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcularClick(Sender: TObject);
var
  Numero: Integer;
begin
  if (edtNumero.Text = '') then
  begin
    ShowMessage('Amigo, preencha o campo!');
    edtNumero.SetFocus();
    Abort;
  end;

  try
    Numero := StrToInt(edtNumero.Text);

    if (Numero mod 2 = 0) then
      ShowMessage('O número é par!')
    else
      ShowMessage('O número é impar!');
  except
    ShowMessage('Preencha um número válido!');

    edtNumero.Clear();
    edtNumero.SetFocus();
    
    Abort;
  end;
end;

end.
