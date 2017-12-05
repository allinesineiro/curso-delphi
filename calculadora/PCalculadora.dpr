program PCalculadora;

uses
  Forms,
  UCalculadora in 'UCalculadora.pas' {Calculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCalculadora, Calculadora);
  Application.Run;
end.
