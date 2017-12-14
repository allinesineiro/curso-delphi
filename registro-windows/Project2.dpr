program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormEditarRegistro};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Registros do Windows';
  Application.CreateForm(TFormEditarRegistro, FormEditarRegistro);
  Application.Run;
end.
