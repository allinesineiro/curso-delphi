unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edtAno: TEdit;
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
  Ano: Integer;

begin
 if (edtAno.Text = '') then

 begin
  ShowMessage('Preencha o ano!');
  edtAno.SetFocus();
  Abort;
 end;


  if (Ano < 1930) then
    begin
      ShowMessage('A Copa do Mundo teve início em 1930!');
   end;

 try
  Ano := StrToInt(edtAno.Text);

  if (Ano = 1942) then
   begin
    ShowMessage('Não teve Copa do Mundo!');
   end;

  if (Ano = 1946) then
   begin
    ShowMessage('Não teve Copa do Mundo!');
   end;

  if ((Ano - 1930) mod 4 = 0)then
   ShowMessage('Teve Copa do Mundo!')
  else
    ShowMessage('Não teve Copa do Mundo!');

  except
   ShowMessage('Preencha um ano válido!');

   edtAno.Clear();
   edtAno.SetFocus();

   Abort;
  end;
end;

end.



