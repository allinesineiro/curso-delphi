object FormEditarRegistro: TFormEditarRegistro
  Left = 558
  Top = 280
  Width = 307
  Height = 260
  Caption = 'Registros do Windows'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpUpdater: TGroupBox
    Left = 8
    Top = 112
    Width = 273
    Height = 97
    Caption = 'Updater'
    TabOrder = 4
  end
  object grpUac: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 97
    Caption = 'UAC'
    TabOrder = 3
  end
  object btnDesabilitarUac: TButton
    Left = 16
    Top = 64
    Width = 257
    Height = 25
    Caption = 'Desabilitar UAC'
    TabOrder = 0
    OnClick = btnDesabilitarUacClick
  end
  object btnHabilitarUac: TButton
    Left = 16
    Top = 32
    Width = 257
    Height = 25
    Caption = 'Habilitar UAC'
    TabOrder = 1
    OnClick = btnHabilitarUacClick
  end
  object btnRemoverSufixo: TButton
    Left = 16
    Top = 168
    Width = 257
    Height = 25
    Caption = 'Remover sufixo updater'
    TabOrder = 2
    OnClick = btnRemoverSufixoClick
  end
  object btn2: TButton
    Left = 16
    Top = 136
    Width = 257
    Height = 25
    Caption = 'Criar sufixo'
    TabOrder = 5
    OnClick = btn2Click
  end
end
