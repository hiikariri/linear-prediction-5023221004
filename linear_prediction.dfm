object Form1: TForm1
  Left = 249
  Top = 98
  Width = 1499
  Height = 664
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 1296
    Top = 16
    Width = 78
    Height = 13
    Caption = 'Auto-correlation'
  end
  object lbl2: TLabel
    Left = 832
    Top = 192
    Width = 52
    Height = 13
    Caption = 'Rxx Matrix'
  end
  object lbl3: TLabel
    Left = 1168
    Top = 192
    Width = 70
    Height = 13
    Caption = 'Inverse Matrix'
  end
  object lbl4: TLabel
    Left = 832
    Top = 16
    Width = 98
    Height = 13
    Caption = 'Predictor Coefficient'
  end
  object lbl5: TLabel
    Left = 1064
    Top = 16
    Width = 24
    Height = 13
    Caption = 'Error'
  end
  object cht1: TChart
    Left = 176
    Top = 32
    Width = 641
    Height = 153
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Audio Signal')
    BottomAxis.Title.Caption = 'Sample Number'
    LeftAxis.Title.Caption = 'Amplitude'
    View3D = False
    TabOrder = 0
    object lnsrsSeries1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Record Signal X(m)'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object lnsrsSeries2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Exitator Signal e(m)'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object lst1: TListBox
    Left = 1296
    Top = 32
    Width = 169
    Height = 153
    ItemHeight = 13
    TabOrder = 1
  end
  object strngrd1: TStringGrid
    Left = 832
    Top = 208
    Width = 281
    Height = 169
    ColCount = 9999999
    FixedCols = 0
    RowCount = 9999999
    FixedRows = 0
    TabOrder = 2
  end
  object strngrd2: TStringGrid
    Left = 1168
    Top = 208
    Width = 297
    Height = 169
    ColCount = 9999999
    FixedCols = 0
    RowCount = 999999
    FixedRows = 0
    TabOrder = 3
  end
  object lst2: TListBox
    Left = 832
    Top = 32
    Width = 225
    Height = 153
    ItemHeight = 13
    TabOrder = 4
  end
  object lst3: TListBox
    Left = 1064
    Top = 32
    Width = 225
    Height = 153
    ItemHeight = 13
    TabOrder = 5
  end
  object cht2: TChart
    Left = 176
    Top = 208
    Width = 641
    Height = 177
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    Title.Text.Strings = (
      'Prediction Signal ')
    BottomAxis.Title.Caption = 'Sample Number '
    LeftAxis.Title.Caption = 'Amplitude '
    View3D = False
    TabOrder = 6
    object lnsrsSeries3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object cht3: TChart
    Left = 176
    Top = 408
    Width = 641
    Height = 185
    Legend.Visible = False
    Title.Text.Strings = (
      'Error')
    BottomAxis.Title.Caption = 'Sample Number'
    LeftAxis.Title.Caption = 'Amplitude'
    View3D = False
    TabOrder = 7
    object lnsrsSeries4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object cht4: TChart
    Left = 832
    Top = 408
    Width = 625
    Height = 185
    Legend.Visible = False
    Title.Text.Strings = (
      'Frequency Respone')
    BottomAxis.Title.Caption = 'Sample Number'
    LeftAxis.Title.Caption = 'Amplitude'
    View3D = False
    TabOrder = 8
    object lnsrsSeries5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object grp1: TGroupBox
    Left = 8
    Top = 32
    Width = 153
    Height = 401
    Caption = 'Control Panel'
    TabOrder = 9
    object btn9: TSpeedButton
      Left = 24
      Top = 304
      Width = 105
      Height = 25
      Caption = 'Mean Squared Error'
      OnClick = btn9Click
    end
    object btn1: TSpeedButton
      Left = 24
      Top = 24
      Width = 105
      Height = 25
      Caption = 'Input Data'
      OnClick = btn1Click
    end
    object btn10: TSpeedButton
      Left = 24
      Top = 360
      Width = 105
      Height = 25
      Caption = 'Frequency Response'
      OnClick = btn10Click
    end
    object btn2: TSpeedButton
      Left = 24
      Top = 80
      Width = 105
      Height = 25
      Caption = 'Auto-correlation'
      OnClick = btn2Click
    end
    object btn3: TSpeedButton
      Left = 24
      Top = 112
      Width = 105
      Height = 25
      Caption = 'Compute Matrix'
      OnClick = btn3Click
    end
    object btn4: TSpeedButton
      Left = 24
      Top = 144
      Width = 105
      Height = 25
      Caption = 'Inverse Matrix'
      OnClick = btn4Click
    end
    object btn5: TSpeedButton
      Left = 24
      Top = 176
      Width = 105
      Height = 25
      Caption = 'Coefficient Predictor'
      OnClick = btn5Click
    end
    object btn6: TSpeedButton
      Left = 24
      Top = 208
      Width = 105
      Height = 25
      Caption = 'Error'
      OnClick = btn6Click
    end
    object btn7: TSpeedButton
      Left = 24
      Top = 240
      Width = 105
      Height = 25
      Caption = 'Linear Prediction '
      OnClick = btn7Click
    end
    object btn8: TSpeedButton
      Left = 24
      Top = 272
      Width = 105
      Height = 25
      Caption = 'Error Model'
      OnClick = btn8Click
    end
    object Edit2: TEdit
      Left = 24
      Top = 336
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 24
      Top = 56
      Width = 105
      Height = 21
      TabOrder = 1
      Text = '5'
    end
  end
  object btn11: TBitBtn
    Left = 8
    Top = 440
    Width = 153
    Height = 41
    TabOrder = 10
    Kind = bkClose
  end
  object mtrx1: TMatrix
    NrOfColumns = 1
    NrOfRows = 1
    Left = 8
    Top = 536
  end
  object mtrx2: TMatrix
    NrOfColumns = 1
    NrOfRows = 1
    Left = 40
    Top = 536
  end
  object open_dialog1: TOpenDialog
    Left = 8
    Top = 488
  end
end
