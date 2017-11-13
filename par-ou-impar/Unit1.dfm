object Form1: TForm1
  Left = 325
  Top = 179
  Width = 265
  Height = 165
  Caption = 'Par ou impar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    249
    126)
  PixelsPerInch = 96
  TextHeight = 15
  object lblNumero: TLabel
    Left = 10
    Top = 10
    Width = 97
    Height = 15
    Caption = 'Informe o n'#250'mero'
    Transparent = True
  end
  object edtNumero: TEdit
    Left = 10
    Top = 28
    Width = 232
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object btnCalcular: TButton
    Left = 10
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 1
    OnClick = btnCalcularClick
  end
end
