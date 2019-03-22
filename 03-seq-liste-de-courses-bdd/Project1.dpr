program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit1 in 'Unit1.pas',
  Unit2 in 'Unit2.pas';

begin
  try
    doMain;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
