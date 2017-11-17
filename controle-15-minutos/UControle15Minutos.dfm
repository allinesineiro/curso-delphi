object Form1: TForm1
  Left = 293
  Top = 166
  Width = 500
  Height = 480
  Caption = 'Controle de Intervalo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblInicial: TLabel
    Left = 24
    Top = 96
    Width = 82
    Height = 13
    Caption = 'MostraHoraInicial'
    Visible = False
  end
  object lblFinal: TLabel
    Left = 24
    Top = 112
    Width = 77
    Height = 13
    Caption = 'MostraHoraFinal'
    Visible = False
  end
  object lblResultado: TLabel
    Left = 24
    Top = 128
    Width = 80
    Height = 13
    Caption = 'TempoRealizado'
    Visible = False
  end
  object btnIniciar: TButton
    Left = 24
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = btnIniciarClick
  end
  object btnFinalizar: TButton
    Left = 144
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Finalizar'
    TabOrder = 1
    OnClick = btnFinalizarClick
  end
  object tmrCronometro: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrCronometroTimer
    Left = 184
    Top = 152
  end
end
