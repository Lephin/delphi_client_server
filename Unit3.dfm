object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 273
  ClientWidth = 176
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
  end
  object Button2: TButton
    Left = 89
    Top = 240
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 200
    Width = 121
    Height = 21
    DataSource = Form1.DataSource1
    TabOrder = 2
  end
end
