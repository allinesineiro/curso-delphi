unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edtNumero: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

var
  Numero: Integer;

begin
 if (edtNumero.Text = '') then
 begin
  ShowMessage('Preencha o n�mero!');
  edtNumero.SetFocus();
  Abort;
 end;

 try
  Numero := StrToInt(edtNumero.Text);

  if (Numero mod 2 = 0) then
   ShowMessage('O n�mero � par!')
  else
   ShowMessage('O n�mero � �mpar!');
  
  except
   ShowMessage('Preencha um n�mero v�lido!');

   edtNumero.Clear();
   edtNumero.SetFocus();

   Abort;
  end;
end;

end.



