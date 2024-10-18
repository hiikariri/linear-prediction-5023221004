unit linear_prediction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, Buttons,
  SDL_matrix, Grids, Math;

type
  TForm1 = class(TForm)
    cht1: TChart;
    cht2: TChart;
    cht3: TChart;
    cht4: TChart;
    lnsrsSeries1: TLineSeries;
    lnsrsSeries2: TLineSeries;
    lnsrsSeries3: TLineSeries;
    lnsrsSeries4: TLineSeries;
    lnsrsSeries5: TLineSeries;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    btn7: TSpeedButton;
    btn8: TSpeedButton;
    btn9: TSpeedButton;
    btn10: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    lst1: TListBox;
    lst2: TListBox;
    lst3: TListBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    strngrd1: TStringGrid;
    strngrd2: TStringGrid;
    mtrx1: TMatrix;
    mtrx2: TMatrix;
    grp1: TGroupBox;
    open_dialog1: TOpenDialog;
    btn11: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;
  file_data: TextFile;
  data_size, time_lag, matrix_size: Integer;
  data_input, predicted_signal, auto_corr_values, filter_coeffs, inv_coeffs, error_signal, reconstructed_signal, mse_values, Double_part, imag_part, magnitude, frequency_response: array[-100000..100000] of Double;
  mse_value, temp_value: Double;
  line_text: string;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  i : Integer;
  filename: string;
  file_data: TextFile;
begin
  lnsrsSeries1.Clear;
  lnsrsSeries2.Clear;
  lnsrsSeries3.Clear;
  lnsrsSeries4.Clear;
  lnsrsSeries5.Clear;
  lst1.Clear;
  lst2.Clear;
  lst3.Clear;

  data_size := 0;

  if open_dialog1.Execute then
  begin
    filename := open_dialog1.FileName;
    assignfile(file_data, filename);
    reset(file_data);

    while not eof(file_data) do
    begin
      readln(file_data, data_input[data_size], data_input[data_size]);
      data_size := data_size + 1;
    end;

    CloseFile(file_data);
    data_size := data_size - 1;

    for i := 0 to data_size - 1 do
    begin
      lnsrsSeries1.AddXY(i, data_input[i]);
    end;
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  lag, n : Integer;
begin
  lst1.Clear;
  time_lag := StrToInt(Edit1.Text);
  for lag := 0 to time_lag do
  begin
    temp_value := 0.0;
    for n := 0 to data_size - 1 do
    begin
      temp_value := temp_value + data_input[n] * data_input[n - lag];
    end;
    auto_corr_values[lag] := temp_value;
    auto_corr_values[-lag] := auto_corr_values[lag];
    lst1.Items.Add('rxx[' + IntToStr(lag) + ']= ' + FloatToStrF(auto_corr_values[lag], ffFixed, 7, 5));
  end;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  row, col : Integer;
begin
  matrix_size := time_lag;
  mtrx1.Resize(matrix_size, matrix_size);
  for row := 1 to matrix_size do
  begin
    for col := 1 to matrix_size do
    begin
      mtrx1.Elem[row, col] := auto_corr_values[(row - 1) - (col - 1)];
      strngrd1.Cells[col - 1, row - 1] := FloatToStrF(mtrx1.Elem[row, col], ffFixed, 7, 5);
    end;
  end;
end;

procedure TForm1.btn4Click(Sender: TObject);
var
  row, col : Integer;
begin
  mtrx1.Invert;
  for row := 1 to matrix_size do
  begin
    for col := 1 to matrix_size do
    begin
      strngrd2.Cells[row - 1, col - 1] := FloatToStr(mtrx1.Elem[row, col]);
    end;
  end;
end;

procedure TForm1.btn5Click(Sender: TObject);
var
  i, k : Integer;
begin
  lst2.Clear;
  matrix_size := time_lag;
  mtrx2.Resize(1, matrix_size);
  for i := 1 to matrix_size do
  begin
    temp_value := 0;
    for k := 1 to matrix_size do
    begin
      temp_value := temp_value + (mtrx1.Elem[k, i] * auto_corr_values[k]);
    end;
    filter_coeffs[i] := temp_value;
    lst2.Items.Add('a[' + IntToStr(i) + ']= ' + FloatToStrF(filter_coeffs[i], ffFixed, 15, 10));
  end;
end;

procedure TForm1.btn6Click(Sender: TObject);
var
  i, k : Integer;
  predicted_signal : Double;
begin
  lst3.Clear;
  lnsrsSeries2.Clear;
  for i := 1 to matrix_size do
  begin
    inv_coeffs[i] := -filter_coeffs[i];
  end;
  for i := 0 to data_size - 1 do
  begin
    predicted_signal := 0;
    error_signal[i] := 0;
    for k := 1 to time_lag do
    begin
      predicted_signal := predicted_signal + (inv_coeffs[k] * data_input[i - k]);
    end;
    error_signal[i] := data_input[i] + predicted_signal;
    lnsrsSeries2.AddXY(i, error_signal[i]);
    lst3.Items.Add('e[' + IntToStr(i) + ']= ' + FloatToStr(error_signal[i]));
  end;
end;

procedure TForm1.btn7Click(Sender: TObject);
var
  i, k : Integer;
begin
  lnsrsSeries3.Clear;
  for i := -time_lag to -1 do
  begin
    reconstructed_signal[i] := 0;
  end;
  for i := 0 to data_size - 1 do
  begin
    temp_value := 0.0;
    for k := 1 to time_lag do
    begin
      temp_value := temp_value + filter_coeffs[k] * data_input[i - k];
    end;
    reconstructed_signal[i] := temp_value + error_signal[i];
  end;
  for i := 0 to data_size - 1 do
  begin
    lnsrsSeries3.AddXY(i, reconstructed_signal[i]);
  end;
end;

procedure TForm1.btn8Click(Sender: TObject);
var
  i : Integer;
begin
  lnsrsSeries4.Clear;
  for i := 0 to data_size - 1 do
  begin
    mse_values[i] := Abs(data_input[i] - reconstructed_signal[i]);
    lnsrsSeries4.AddXY(i, mse_values[i]);
  end;
end;

procedure TForm1.btn9Click(Sender: TObject);
var
  i : Integer;
begin
  mse_value := 0;
  for i := 0 to data_size - 1 do
  begin
    mse_value := mse_value + Power(mse_values[i], 2);
  end;
  mse_value := mse_value / data_size;
  Edit2.Text := FloatToStr(mse_value);
end;

procedure TForm1.btn10Click(Sender: TObject);
var
  f, k : Integer;
begin
  lnsrsSeries5.Clear;
  for f := 0 to data_size - 1 do
  begin
    Double_part[f] := 0;
    imag_part[f] := 0;
    for k := 1 to time_lag do
    begin
      Double_part[f] := Double_part[f] + filter_coeffs[k] * Cos(2 * Pi * k * f / data_size);
      imag_part[f] := imag_part[f] - filter_coeffs[k] * Sin(2 * Pi * k * f / data_size);
    end;
    magnitude[f] := Sqrt(Sqr(1 - Double_part[f]) + Sqr(imag_part[f]));
    frequency_response[f] := mse_value / magnitude[f];
  end;
  for f := 0 to Round((data_size - 1) / 2) do
  begin
    lnsrsSeries5.AddXY(f / data_size, frequency_response[f]);
  end;
end;

end.

