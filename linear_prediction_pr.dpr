program linear_prediction_pr;

uses
  Forms,
  linear_prediction in 'linear_prediction.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
